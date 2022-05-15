import 'dart:convert';

ForgetPasswordModel forgetPasswordModelFromJson(String str) => ForgetPasswordModel.fromJson(json.decode(str));

String forgetPasswordModelToJson(ForgetPasswordModel data) => json.encode(data.toJson());

class ForgetPasswordModel {
  ForgetPasswordModel({
    this.status,
    this.message,
    this.tmpToken,
  });

  int? status;
  String? message;
  String? tmpToken;

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) => ForgetPasswordModel(
    status: json["status"],
    message: json["message"] ?? '',
    tmpToken: json["tmpToken"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "tmpToken": tmpToken,
  };
}
