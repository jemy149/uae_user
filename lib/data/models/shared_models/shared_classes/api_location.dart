class ApiLocation {
  ApiLocation({
    int? id,
    double? longitude,
    double? latitude,
    String? address,}){
    _id = id;
    _longitude = longitude;
    _latitude = latitude;
    _address = address;
  }

  ApiLocation.fromJson(dynamic json) {
    _id = json['id'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _address = json['address'];
  }
  int? _id;
  double? _longitude;
  double? _latitude;
  String? _address;

  int get id => _id ?? 0;
  double get longitude => _longitude ?? 0.0;
  double get latitude => _latitude ?? 0.0;
  String get address => _address ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['address'] = _address;
    return map;
  }

}