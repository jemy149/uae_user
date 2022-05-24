import 'dart:convert';
ChangeFavoriteModel changeFavoriteModelFromJson(String str) => ChangeFavoriteModel.fromJson(json.decode(str));
String changeFavoriteModelToJson(ChangeFavoriteModel data) => json.encode(data.toJson());
class ChangeFavoriteModel {
  ChangeFavoriteModel({
      int? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  ChangeFavoriteModel.fromJson(dynamic json) {
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