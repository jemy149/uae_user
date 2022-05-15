import 'dart:convert';

SetFirebaseTokenModel setFirebaseTokenModelFromJson(String str) => SetFirebaseTokenModel.fromJson(json.decode(str));

String setFirebaseTokenModelToJson(SetFirebaseTokenModel data) => json.encode(data.toJson());

class SetFirebaseTokenModel {
  SetFirebaseTokenModel({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory SetFirebaseTokenModel.fromJson(Map<String, dynamic> json) => SetFirebaseTokenModel(
    status: json["status"],
    message: json["message"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
