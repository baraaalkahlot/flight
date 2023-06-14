import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../init/application.dart';

enum RestAPIRequestMethods { GET, PUT, POST, DELETE, PATCH }

/// Singleton class
class RestAPIService {
  static RestAPIService? _instance;

  RestAPIService._internal();

  static RestAPIService? getInstance() {
    _instance ??= RestAPIService._internal();
    return _instance;
  }

  Future<dynamic> requestCall(
      {required String apiEndPoint,
      required RestAPIRequestMethods method,
      dynamic requestParams}) async {
    String apiEndPointUrl = apiEndPoint;

    /// make the complete URL of API
    Uri apiUrl = Uri.parse(apiEndPointUrl);

    /// json encode the request params
    dynamic requestParameters = json.encode(requestParams);

    Map<String, String> httpHeaders = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    var responseJson;
    print("request: => $apiUrl");
    print("httpHeaders: => $httpHeaders");
    print("requestParams: => $requestParams");
    switch (method) {
      case RestAPIRequestMethods.GET:
        try {
          if (requestParams == null) {
            final response = await http.get(apiUrl, headers: httpHeaders);
            responseJson = _returnResponse(response);
          } else {
            /// get request with body
            final request = http.Request("GET", apiUrl);
            request.headers.addAll(httpHeaders);
            request.body = json.encode(requestParams);
            final streamedResponse = await request.send();
            final response = await http.Response.fromStream(streamedResponse);
            responseJson = _returnResponse(response);
          }
        } on SocketException {
          throw FetchDataException(0000,
              'No internet connection found, Please check your internet and try again!');
        } on FormatException {
          throw BadRequestException(0001,
              'Unable to process your request due to some failure, Please try again later!');
        } on http.ClientException {
          throw FetchDataException(0002,
              'Oh No! Unable to process your request. Possible cases may be server is not reachable or if server runs on VPN then VPN should be connected on mobile device!');
        }
        break;
      case RestAPIRequestMethods.POST:
        try {
          final response = await http.post(apiUrl,
              body: requestParameters, headers: httpHeaders);
          responseJson = _returnResponse(response);
        } on SocketException {
          throw FetchDataException(0000,
              'No internet connection found, Please check your internet and try again!');
        } on FormatException {
          throw BadRequestException(0001,
              'Unable to process your request due to some failure, Please try again later!');
        } on http.ClientException {
          throw FetchDataException(0002,
              'Oh No! Unable to process your request. Possible cases may be server is not reachable or if server runs on VPN then VPN should be connected on mobile device!');
        }
        break;
      case RestAPIRequestMethods.PUT:
        try {
          final response = await http.put(apiUrl,
              body: requestParameters, headers: httpHeaders);
          responseJson = _returnResponse(response);
        } on SocketException {
          throw FetchDataException(0000,
              'No internet connection found, Please check your internet and try again!');
        } on FormatException {
          throw BadRequestException(0001,
              'Unable to process your request due to some failure, Please try again later!');
        } on http.ClientException {
          throw FetchDataException(0002,
              'Oh No! Unable to process your request. Possible cases may be server is not reachable or if server runs on VPN then VPN should be connected on mobile device!');
        }
        break;
      case RestAPIRequestMethods.DELETE:
        try {
          /// normal delete request without body
          if (requestParams == null) {
            final response = await http.delete(apiUrl, headers: httpHeaders);
            responseJson = _returnResponse(response);
          } else {
            /// delete request with body
            final request = http.Request("DELETE", apiUrl);
            request.headers.addAll(httpHeaders);
            request.body = json.encode(requestParams);
            final streamedResponse = await request.send();
            final response = await http.Response.fromStream(streamedResponse);
            responseJson = _returnResponse(response);
          }
        } on SocketException {
          throw FetchDataException(0000,
              'No internet connection found, Please check your internet and try again!');
        } on FormatException {
          throw BadRequestException(0001,
              'Unable to process your request due to some failure, Please try again later!');
        } on http.ClientException {
          throw FetchDataException(0002,
              'Oh No! Unable to process your request. Possible cases may be server is not reachable or if server runs on VPN then VPN should be connected on mobile device!');
        }
        break;
      case RestAPIRequestMethods.PATCH:
        try {
          final response = await http.patch(apiUrl,
              body: requestParameters, headers: httpHeaders);
          responseJson = _returnResponse(response);
        } on SocketException {
          throw FetchDataException(0000,
              'No internet connection found, Please check your internet and try again!');
        } on FormatException {
          throw BadRequestException(0001,
              'Unable to process your request due to some failure, Please try again later!');
        } on http.ClientException {
          throw FetchDataException(0002,
              'Oh No! Unable to process your request. Possible cases may be server is not reachable or if server runs on VPN then VPN should be connected on mobile device!');
        }
        break;
      default:
        break;
    }
    print("responseJson: => $responseJson");
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    Map<String, dynamic> responseBody = _getResponseBody(response);

    switch (response.statusCode) {
      case 200:
      case 201:
        var returnJson = responseBody['data'] ?? responseBody;
        return returnJson;
      case 204:
        Map<String, bool> returnMap = {'success': true};
        return returnMap;
      case 400:
        throw BadRequestException(
            responseBody['code'], responseBody['message']);

      /// Handle un authentication
      case 401:
      case 403:
        throw UnAuthorisedException(
            responseBody['code'], responseBody['message']);

      /// Handle un verified phone number
      case 410:
        throw UnVerifiedException(
            responseBody['code'], responseBody['message']);
      default:
        throw BadRequestException(
            responseBody['code'], responseBody['message']);
    }
  }

  Map<String, dynamic> _getResponseBody(http.Response response) {
    Map<String, dynamic> responseBody = {};
    if (response.body.isNotEmpty) {
      /// decode the response
      var jsonResponse = json.decode(response.body);
      responseBody = jsonResponse;
    } else {
      responseBody = {
        'error': {'code': 1111, 'message': 'Unexpected error'}
      };
    }
    return responseBody;
  }
}

class RestAPICallException implements Exception {
  final int _errorCode;
  final String _message;

  RestAPICallException(this._errorCode, this._message);

  int get errorCode => _errorCode;

  @override
  String toString() {
    return _message;
  }
}

class FetchDataException extends RestAPICallException {
  FetchDataException(int errorCode, String message) : super(errorCode, message);
}

class BadRequestException extends RestAPICallException {
  BadRequestException(int errorCode, String message)
      : super(errorCode, message);
}

class UnAuthenticationException extends RestAPICallException {
  UnAuthenticationException(int errorCode, String message)
      : super(errorCode, message);
}

class UnAuthorisedException extends RestAPICallException {
  UnAuthorisedException(int errorCode, String message)
      : super(errorCode, message);
}

class UnVerifiedException extends RestAPICallException {
  UnVerifiedException(int errorCode, String message)
      : super(errorCode, message);
}
