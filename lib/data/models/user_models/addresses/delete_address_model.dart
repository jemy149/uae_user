import 'dart:convert';
DeleteAddressModel deleteAddressModelFromJson(String str) => DeleteAddressModel.fromJson(json.decode(str));
String deleteAddressModelToJson(DeleteAddressModel data) => json.encode(data.toJson());
class DeleteAddressModel {
  DeleteAddressModel({
      int? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  DeleteAddressModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  int? _status;
  String? _message;

  int get status => _status??0;
  String get message => _message??"";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}