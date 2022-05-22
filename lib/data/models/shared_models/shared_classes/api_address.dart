import 'dart:convert';

ApiAddress myAddressFromJson(String str) => ApiAddress.fromJson(json.decode(str));

String myAddressToJson(ApiAddress data) => json.encode(data.toJson());

class ApiAddress {
  ApiAddress({
    int? id,
    num? latitude,
    num? longitude,
    String? address,
    String? description,
    int? isDefult,
    String? createdAt,
    int? providersId,
    int? usersId,
    String? deletedAt,
  }) {
    _id = id;
    _latitude = latitude;
    _longitude = longitude;
    _address = address;
    _description = description;
    _isDefult = isDefult;
    _createdAt = createdAt;
    _providersId = providersId;
    _usersId = usersId;
    _deletedAt = deletedAt;
  }

  ApiAddress.fromJson(dynamic json) {
    _id = json['id'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _address = json['address'];
    _description = json['description'];
    _isDefult = json['isDefult'];
    _createdAt = json['createdAt'];
    _providersId = json['providers_id'];
    _usersId = json['users_id'];
    _deletedAt = json['deletedAt'];
  }

  int? _id;
  num? _latitude;
  num? _longitude;
  String? _address;
  String? _description;
  int? _isDefult;
  String? _createdAt;
  int? _providersId;
  int? _usersId;
  String? _deletedAt;

  int get id => _id ?? 0;

  num get latitude => _latitude ?? 0;

  num get longitude => _longitude?? 0;

  String get address => _address??"";

  String get description => _description??"";

  int get isDefult => _isDefult??0;

  String get createdAt => _createdAt??"";

  int get providersId => _providersId??0;

  int get usersId => _usersId??0;

  String get deletedAt => _deletedAt??"";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['address'] = _address;
    map['description'] = _description;
    map['isDefult'] = _isDefult;
    map['createdAt'] = _createdAt;
    map['providers_id'] = _providersId;
    map['users_id'] = _usersId;
    map['deletedAt'] = _deletedAt;
    return map;
  }
}