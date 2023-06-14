class Segments {
  Segments({
      String? duration, 
      String? departureLocationCode, 
      String? departureDate, 
      String? arrivalLocationCode, 
      String? arrivalDate, 
      String? fDepartureDate, 
      String? fArrivalDate, 
      String? carrierCode, 
      String? carrierName, 
      String? number, 
      String? aircraft, 
      String? departureCity, 
      String? arrivalCity, 
      String? departureTerminal, 
      String? arrivalTerminal, 
      String? departureAirport, 
      String? arrivalAirport, 
      String? cabin, 
      String? aircraftName, 
      dynamic stopTime,}){
    _duration = duration;
    _departureLocationCode = departureLocationCode;
    _departureDate = departureDate;
    _arrivalLocationCode = arrivalLocationCode;
    _arrivalDate = arrivalDate;
    _fDepartureDate = fDepartureDate;
    _fArrivalDate = fArrivalDate;
    _carrierCode = carrierCode;
    _carrierName = carrierName;
    _number = number;
    _aircraft = aircraft;
    _departureCity = departureCity;
    _arrivalCity = arrivalCity;
    _departureTerminal = departureTerminal;
    _arrivalTerminal = arrivalTerminal;
    _departureAirport = departureAirport;
    _arrivalAirport = arrivalAirport;
    _cabin = cabin;
    _aircraftName = aircraftName;
    _stopTime = stopTime;
}

  Segments.fromJson(dynamic json) {
    _duration = json['duration'];
    _departureLocationCode = json['departureLocationCode'];
    _departureDate = json['departureDate'];
    _arrivalLocationCode = json['arrivalLocationCode'];
    _arrivalDate = json['arrivalDate'];
    _fDepartureDate = json['fDepartureDate'];
    _fArrivalDate = json['fArrivalDate'];
    _carrierCode = json['carrierCode'];
    _carrierName = json['carrierName'];
    _number = json['number'];
    _aircraft = json['aircraft'];
    _departureCity = json['departureCity'];
    _arrivalCity = json['arrivalCity'];
    _departureTerminal = json['departureTerminal'];
    _arrivalTerminal = json['arrivalTerminal'];
    _departureAirport = json['departureAirport'];
    _arrivalAirport = json['arrivalAirport'];
    _cabin = json['cabin'];
    _aircraftName = json['aircraftName'];
    _stopTime = json['stopTime'];
  }
  String? _duration;
  String? _departureLocationCode;
  String? _departureDate;
  String? _arrivalLocationCode;
  String? _arrivalDate;
  String? _fDepartureDate;
  String? _fArrivalDate;
  String? _carrierCode;
  String? _carrierName;
  String? _number;
  String? _aircraft;
  String? _departureCity;
  String? _arrivalCity;
  String? _departureTerminal;
  String? _arrivalTerminal;
  String? _departureAirport;
  String? _arrivalAirport;
  String? _cabin;
  String? _aircraftName;
  dynamic _stopTime;
Segments copyWith({  String? duration,
  String? departureLocationCode,
  String? departureDate,
  String? arrivalLocationCode,
  String? arrivalDate,
  String? fDepartureDate,
  String? fArrivalDate,
  String? carrierCode,
  String? carrierName,
  String? number,
  String? aircraft,
  String? departureCity,
  String? arrivalCity,
  String? departureTerminal,
  String? arrivalTerminal,
  String? departureAirport,
  String? arrivalAirport,
  String? cabin,
  String? aircraftName,
  dynamic stopTime,
}) => Segments(  duration: duration ?? _duration,
  departureLocationCode: departureLocationCode ?? _departureLocationCode,
  departureDate: departureDate ?? _departureDate,
  arrivalLocationCode: arrivalLocationCode ?? _arrivalLocationCode,
  arrivalDate: arrivalDate ?? _arrivalDate,
  fDepartureDate: fDepartureDate ?? _fDepartureDate,
  fArrivalDate: fArrivalDate ?? _fArrivalDate,
  carrierCode: carrierCode ?? _carrierCode,
  carrierName: carrierName ?? _carrierName,
  number: number ?? _number,
  aircraft: aircraft ?? _aircraft,
  departureCity: departureCity ?? _departureCity,
  arrivalCity: arrivalCity ?? _arrivalCity,
  departureTerminal: departureTerminal ?? _departureTerminal,
  arrivalTerminal: arrivalTerminal ?? _arrivalTerminal,
  departureAirport: departureAirport ?? _departureAirport,
  arrivalAirport: arrivalAirport ?? _arrivalAirport,
  cabin: cabin ?? _cabin,
  aircraftName: aircraftName ?? _aircraftName,
  stopTime: stopTime ?? _stopTime,
);
  String? get duration => _duration;
  String? get departureLocationCode => _departureLocationCode;
  String? get departureDate => _departureDate;
  String? get arrivalLocationCode => _arrivalLocationCode;
  String? get arrivalDate => _arrivalDate;
  String? get fDepartureDate => _fDepartureDate;
  String? get fArrivalDate => _fArrivalDate;
  String? get carrierCode => _carrierCode;
  String? get carrierName => _carrierName;
  String? get number => _number;
  String? get aircraft => _aircraft;
  String? get departureCity => _departureCity;
  String? get arrivalCity => _arrivalCity;
  String? get departureTerminal => _departureTerminal;
  String? get arrivalTerminal => _arrivalTerminal;
  String? get departureAirport => _departureAirport;
  String? get arrivalAirport => _arrivalAirport;
  String? get cabin => _cabin;
  String? get aircraftName => _aircraftName;
  dynamic get stopTime => _stopTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['duration'] = _duration;
    map['departureLocationCode'] = _departureLocationCode;
    map['departureDate'] = _departureDate;
    map['arrivalLocationCode'] = _arrivalLocationCode;
    map['arrivalDate'] = _arrivalDate;
    map['fDepartureDate'] = _fDepartureDate;
    map['fArrivalDate'] = _fArrivalDate;
    map['carrierCode'] = _carrierCode;
    map['carrierName'] = _carrierName;
    map['number'] = _number;
    map['aircraft'] = _aircraft;
    map['departureCity'] = _departureCity;
    map['arrivalCity'] = _arrivalCity;
    map['departureTerminal'] = _departureTerminal;
    map['arrivalTerminal'] = _arrivalTerminal;
    map['departureAirport'] = _departureAirport;
    map['arrivalAirport'] = _arrivalAirport;
    map['cabin'] = _cabin;
    map['aircraftName'] = _aircraftName;
    map['stopTime'] = _stopTime;
    return map;
  }

}