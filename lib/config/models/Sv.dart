class Sv {
  Sv({
      int? count, 
      String? name, 
      String? code,}){
    _count = count;
    _name = name;
    _code = code;
}

  Sv.fromJson(dynamic json) {
    _count = json['count'];
    _name = json['name'];
    _code = json['code'];
  }
  int? _count;
  String? _name;
  String? _code;
Sv copyWith({  int? count,
  String? name,
  String? code,
}) => Sv(  count: count ?? _count,
  name: name ?? _name,
  code: code ?? _code,
);
  int? get count => _count;
  String? get name => _name;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['name'] = _name;
    map['code'] = _code;
    return map;
  }

}