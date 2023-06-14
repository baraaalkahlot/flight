import 'Routes.dart';
import 'Price.dart';

class Flights {
  Flights({
      String? uuid, 
      String? fid, 
      bool? oneWay, 
      int? availableSeats, 
      List<Routes>? routes, 
      Price? price, 
      List<int>? stops, 
      List<String>? carriers,}){
    _uuid = uuid;
    _fid = fid;
    _oneWay = oneWay;
    _availableSeats = availableSeats;
    _routes = routes;
    _price = price;
    _stops = stops;
    _carriers = carriers;
}

  Flights.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _fid = json['fid'];
    _oneWay = json['oneWay'];
    _availableSeats = json['availableSeats'];
    if (json['routes'] != null) {
      _routes = [];
      json['routes'].forEach((v) {
        _routes?.add(Routes.fromJson(v));
      });
    }
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
    _stops = json['stops'] != null ? json['stops'].cast<int>() : [];
    _carriers = json['carriers'] != null ? json['carriers'].cast<String>() : [];
  }
  String? _uuid;
  String? _fid;
  bool? _oneWay;
  int? _availableSeats;
  List<Routes>? _routes;
  Price? _price;
  List<int>? _stops;
  List<String>? _carriers;
Flights copyWith({  String? uuid,
  String? fid,
  bool? oneWay,
  int? availableSeats,
  List<Routes>? routes,
  Price? price,
  List<int>? stops,
  List<String>? carriers,
}) => Flights(  uuid: uuid ?? _uuid,
  fid: fid ?? _fid,
  oneWay: oneWay ?? _oneWay,
  availableSeats: availableSeats ?? _availableSeats,
  routes: routes ?? _routes,
  price: price ?? _price,
  stops: stops ?? _stops,
  carriers: carriers ?? _carriers,
);
  String? get uuid => _uuid;
  String? get fid => _fid;
  bool? get oneWay => _oneWay;
  int? get availableSeats => _availableSeats;
  List<Routes>? get routes => _routes;
  Price? get price => _price;
  List<int>? get stops => _stops;
  List<String>? get carriers => _carriers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['fid'] = _fid;
    map['oneWay'] = _oneWay;
    map['availableSeats'] = _availableSeats;
    if (_routes != null) {
      map['routes'] = _routes?.map((v) => v.toJson()).toList();
    }
    if (_price != null) {
      map['price'] = _price?.toJson();
    }
    map['stops'] = _stops;
    map['carriers'] = _carriers;
    return map;
  }

}