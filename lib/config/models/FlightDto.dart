import 'Response.dart';

class FlightDto {
  FlightDto({
      Response? response,}){
    _response = response;
}

  FlightDto.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
FlightDto copyWith({  Response? response,
}) => FlightDto(  response: response ?? _response,
);
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}