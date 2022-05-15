import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.status,
    this.message,
    this.account,
  });

  int? status;
  String? message;
  Account? account;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    message: json["message"],
    account: json["Account"] == null ? null : Account.fromJson(json["Account"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Account": account?.toJson(),
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
