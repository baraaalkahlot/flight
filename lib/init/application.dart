import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/services/rest_api_service.dart';

class Application {

  /// assign and hold the instance of singleton class RestAPIService
  static RestAPIService? restService;


  /// Detect the target platform
  static TargetPlatform platform =
      Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android;

  /// bool to check whether the user is already login the application
  static bool isUserLoggedIn = false;

  /// boot to check if this first time open the app
  static bool isFirstRun = true;

}
