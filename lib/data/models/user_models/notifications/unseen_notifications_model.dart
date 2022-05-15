import 'dart:convert';

UnSeenNotificationsModel unSeenNotificationsModelFromJson(String str) => UnSeenNotificationsModel.fromJson(json.decode(str));

String unSeenNotificationsModelToJson(UnSeenNotificationsModel data) => json.encode(data.toJson());

class UnSeenNotificationsModel {
  UnSeenNotificationsModel({
    this.status,
    this.message,
    this.count,
  });

  int? status;
  String? message;
  int? count;

  factory UnSeenNotificationsModel.fromJson(Map<String, dynamic> json) => UnSeenNotificationsModel(
    status: json["status"],
    message: json["message"] ?? '',
    count: json["count"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "count": count,
  };
}
