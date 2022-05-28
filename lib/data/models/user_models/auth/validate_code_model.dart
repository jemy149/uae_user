import 'dart:convert';

ValidateCodeModel validateCodeModelFromJson(String str) => ValidateCodeModel.fromJson(json.decode(str));

String validateCodeModelToJson(ValidateCodeModel data) => json.encode(data.toJson());

class ValidateCodeModel {
  ValidateCodeModel({
    int? status,
    String? apiToken,
    Account? account,
    String? message,
  }){
    _status = status;
    _apiToken=apiToken;
    _account = account;
    _message = message;
  }

  int? _status;
  String? _apiToken;
  String? _message;
  Account? _account;

  ValidateCodeModel.fromJson(dynamic json) {
    _status = json['status'];
    _apiToken = json['apiToken'];
    _account = json['Account'] != null ? Account.fromJson(json['Account']) : null;
    _message = json['message'];
  }

  int get status => _status??0;
  String get apiToken => _apiToken??"";
  Account get account => _account??Account();
  String get message => _message??"";

  Map<String, dynamic> toJson() => {
    "status": _status,
    "apiToken": _apiToken,
    "message": _message,
    "Account": _account?.toJson(),
  };
}

class Account {
  Account({
    String? apiToken,
    String? name,
    String? phone,
    String? email,
    String? type,
    User? user,}){
    _apiToken = apiToken;
    _name = name;
    _phone = phone;
    _email = email;
    _type = type;
    _user = user;
  }

  Account.fromJson(dynamic json) {
    _apiToken = json['apiToken'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _type = json['type'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _apiToken;
  String? _name;
  String? _phone;
  String? _email;
  String? _type;
  User? _user;

  String? get apiToken => _apiToken??"";
  String? get name => _name??"";
  String? get phone => _phone??"";
  String? get email => _email??"";
  String? get type => _type??"";
  User? get user => _user??User();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiToken'] = _apiToken;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['type'] = _type;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
    int? id,
    String? name,
    String? phone,
    String? image,
    int? rate,}){
    _id = id;
    _name = name;
    _phone = phone;
    _image = image;
    _rate = rate;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _image = json['image'];
    _rate = json['rate'];
  }
  int? _id;
  String? _name;
  String? _phone;
  String? _image;
  int? _rate;

  int? get id => _id??0;
  String? get name => _name??"";
  String? get phone => _phone??"";
  String? get image => _image??"";
  int? get rate => _rate??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['image'] = _image;
    map['rate'] = _rate;
    return map;
  }

}