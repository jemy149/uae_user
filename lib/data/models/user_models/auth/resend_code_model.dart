import 'dart:convert';

ResendCodeModel resendCodeModelFromJson(String str) => ResendCodeModel.fromJson(json.decode(str));

String resendCodeModelToJson(ResendCodeModel data) => json.encode(data.toJson());

class ResendCodeModel {
  ResendCodeModel({
    this.status,
  });

  int? status;

  factory ResendCodeModel.fromJson(Map<String, dynamic> json) => ResendCodeModel(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
