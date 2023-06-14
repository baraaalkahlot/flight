class Price {
  Price({
      String? currency, 
      double? grandTotal,}){
    _currency = currency;
    _grandTotal = grandTotal;
}

  Price.fromJson(dynamic json) {
    _currency = json['currency'];
    _grandTotal = json['grandTotal'];
  }
  String? _currency;
  double? _grandTotal;
Price copyWith({  String? currency,
  double? grandTotal,
}) => Price(  currency: currency ?? _currency,
  grandTotal: grandTotal ?? _grandTotal,
);
  String? get currency => _currency;
  double? get grandTotal => _grandTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currency'] = _currency;
    map['grandTotal'] = _grandTotal;
    return map;
  }

}