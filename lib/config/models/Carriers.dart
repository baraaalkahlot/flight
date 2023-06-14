import 'Sv.dart';
import 'Xy.dart';

class Carriers {
  Carriers({
      Sv? sv, 
      Xy? xy,}){
    _sv = sv;
    _xy = xy;
}

  Carriers.fromJson(dynamic json) {
    _sv = json['SV'] != null ? Sv.fromJson(json['SV']) : null;
    _xy = json['XY'] != null ? Xy.fromJson(json['XY']) : null;
  }
  Sv? _sv;
  Xy? _xy;
Carriers copyWith({  Sv? sv,
  Xy? xy,
}) => Carriers(  sv: sv ?? _sv,
  xy: xy ?? _xy,
);
  Sv? get sv => _sv;
  Xy? get xy => _xy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sv != null) {
      map['SV'] = _sv?.toJson();
    }
    if (_xy != null) {
      map['XY'] = _xy?.toJson();
    }
    return map;
  }

}