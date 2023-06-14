import 'Flights.dart';
import 'Carriers.dart';

class Response {
  Response({
      String? uid, 
      List<Flights>? flights, 
      Carriers? carriers,}){
    _uid = uid;
    _flights = flights;
    _carriers = carriers;
}

  Response.fromJson(dynamic json) {
    _uid = json['uid'];
    if (json['flights'] != null) {
      _flights = [];
      json['flights'].forEach((v) {
        _flights?.add(Flights.fromJson(v));
      });
    }
    _carriers = json['carriers'] != null ? Carriers.fromJson(json['carriers']) : null;
  }
  String? _uid;
  List<Flights>? _flights;
  Carriers? _carriers;
Response copyWith({  String? uid,
  List<Flights>? flights,
  Carriers? carriers,
}) => Response(  uid: uid ?? _uid,
  flights: flights ?? _flights,
  carriers: carriers ?? _carriers,
);
  String? get uid => _uid;
  List<Flights> get flights => _flights ?? [];
  Carriers? get carriers => _carriers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    if (_flights != null) {
      map['flights'] = _flights?.map((v) => v.toJson()).toList();
    }
    if (_carriers != null) {
      map['carriers'] = _carriers?.toJson();
    }
    return map;
  }

}