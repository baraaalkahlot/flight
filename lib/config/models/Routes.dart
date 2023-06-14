import 'Segments.dart';

class Routes {
  Routes({
      String? fullDuration, 
      bool? direct, 
      int? stops, 
      List<Segments>? segments,}){
    _fullDuration = fullDuration;
    _direct = direct;
    _stops = stops;
    _segments = segments;
}

  Routes.fromJson(dynamic json) {
    _fullDuration = json['full_duration'];
    _direct = json['direct'];
    _stops = json['stops'];
    if (json['segments'] != null) {
      _segments = [];
      json['segments'].forEach((v) {
        _segments?.add(Segments.fromJson(v));
      });
    }
  }
  String? _fullDuration;
  bool? _direct;
  int? _stops;
  List<Segments>? _segments;
Routes copyWith({  String? fullDuration,
  bool? direct,
  int? stops,
  List<Segments>? segments,
}) => Routes(  fullDuration: fullDuration ?? _fullDuration,
  direct: direct ?? _direct,
  stops: stops ?? _stops,
  segments: segments ?? _segments,
);
  String? get fullDuration => _fullDuration;
  bool? get direct => _direct;
  int? get stops => _stops;
  List<Segments>? get segments => _segments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_duration'] = _fullDuration;
    map['direct'] = _direct;
    map['stops'] = _stops;
    if (_segments != null) {
      map['segments'] = _segments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}