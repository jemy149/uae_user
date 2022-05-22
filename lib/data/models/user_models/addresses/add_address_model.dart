import 'dart:convert';

import '../../shared_models/shared_classes/api_address.dart';
AddAndEditAddressModel addAddressModelFromJson(String str) => AddAndEditAddressModel.fromJson(json.decode(str));
String addAddressModelToJson(AddAndEditAddressModel data) => json.encode(data.toJson());
class AddAndEditAddressModel {
  AddAndEditAddressModel({
      int? status, 
      String? message,
    ApiAddress? location,}){
    _status = status;
    _message = message;
    _location = location;
}

  AddAndEditAddressModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _location = json['location'] != null ? ApiAddress.fromJson(json['location']) : null;
  }
  int? _status;
  String? _message;
  ApiAddress? _location;

  int get status => _status??0;
  String get message => _message??"";
  ApiAddress get location => _location??ApiAddress();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    return map;
  }

}

