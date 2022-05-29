// import 'dart:convert';
// LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
// String loginModelToJson(LoginModel data) => json.encode(data.toJson());
// class LoginModel {
//   LoginModel({
//       int? status,
//       Account? account,
//       String? message,}){
//     _status = status;
//     _account = account;
//     _message = message;
// }
//
//   LoginModel.fromJson(dynamic json) {
//     _status = json['status'];
//     _account = json['account'] != null ? Account.fromJson(json['account']) : null;
//     _message = json['message'];
//   }
//   int? _status;
//   Account? _account;
//   String? _message;
//
//   int get status => _status??0;
//   Account get account => _account??Account();
//   String get message => _message??"";
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = _status;
//     if (_account != null) {
//       map['account'] = _account?.toJson();
//     }
//     map['message'] = _message;
//     return map;
//   }
//
// }
//
// Account accountFromJson(String str) => Account.fromJson(json.decode(str));
// String accountToJson(Account data) => json.encode(data.toJson());
// class Account {
//   Account({
//       String? apiToken,
//       String? name,
//       String? phone,
//       String? email,
//       String? type,
//       User? user,}){
//     _apiToken = apiToken;
//     _name = name;
//     _phone = phone;
//     _email = email;
//     _type = type;
//     _user = user;
// }
//
//   Account.fromJson(dynamic json) {
//     _apiToken = json['apiToken'];
//     _name = json['name'];
//     _phone = json['phone'];
//     _email = json['email'];
//     _type = json['type'];
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }
//   String? _apiToken;
//   String? _name;
//   String? _phone;
//   String? _email;
//   String? _type;
//   User? _user;
//
//   String? get apiToken => _apiToken;
//   String get name => _name??"";
//   String get phone => _phone??"";
//   String get email => _email??"";
//   String get type => _type??"";
//   User get user => _user??User();
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['apiToken'] = _apiToken;
//     map['name'] = _name;
//     map['phone'] = _phone;
//     map['email'] = _email;
//     map['type'] = _type;
//     if (_user != null) {
//       map['user'] = _user?.toJson();
//     }
//     return map;
//   }
//
// }
//
// User userFromJson(String str) => User.fromJson(json.decode(str));
// String userToJson(User data) => json.encode(data.toJson());
// class User {
//   User({
//       int? id,
//       String? name,
//       String? phone,
//       int? rate,}){
//     _id = id;
//     _name = name;
//     _phone = phone;
//     _rate = rate;
// }
//
//   User.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _phone = json['phone'];
//     _rate = json['rate'];
//   }
//   int? _id;
//   String? _name;
//   String? _phone;
//   int? _rate;
//
//   int get id => _id??0;
//   String get name => _name??"";
//   String get phone => _phone??"";
//   int get rate => _rate??0;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['phone'] = _phone;
//     map['rate'] = _rate;
//     return map;
//   }
//
// }
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.account,
    this.message,
  });

  int? status;
  Account? account;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    account: json["Account"] == null ? null : Account.fromJson(json["Account"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Account": account?.toJson(),
    "message": message,
  };
}

class Account {
  Account({
    this.apiToken,
    this.name,
    this.phone,
    this.email,
    this.type,
    this.user,
  });

  String? apiToken;
  String? name;
  String? phone;
  dynamic email;
  String? type;
  User? user;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    apiToken: json["apiToken"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    type: json["type"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "apiToken": apiToken,
    "name": name,
    "phone": phone,
    "email": email,
    "type": type,
    "user": user?.toJson(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.phone,
    this.image,
    this.rate,
  });

  int? id;
  String? name;
  String? phone;
  String? image;
  int? rate;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    image: json["image"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "image": image,
    "rate": rate,
  };
}