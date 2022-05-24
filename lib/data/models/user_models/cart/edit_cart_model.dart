import 'dart:convert';
EditCartModel editCartModelFromJson(String str) => EditCartModel.fromJson(json.decode(str));
String editCartModelToJson(EditCartModel data) => json.encode(data.toJson());
class EditCartModel {
  EditCartModel({
      int? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  EditCartModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  int? _status;
  String? _message;

  int get status => _status ?? 0;
  String get message => _message ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}