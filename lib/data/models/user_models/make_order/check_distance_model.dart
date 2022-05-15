import 'dart:convert';

CheckDistanceModel checkDistanceModelFromJson(String str) => CheckDistanceModel.fromJson(json.decode(str));

String checkDistanceModelToJson(CheckDistanceModel data) => json.encode(data.toJson());

class CheckDistanceModel {
  CheckDistanceModel({
    this.status,
    this.deliveryPrice,
    this.distance,
    this.message,
    this.maxRange,
  });

  int? status;
  int? deliveryPrice;
  double? distance;
  String? message;
  int? maxRange;

  factory CheckDistanceModel.fromJson(Map<String, dynamic> json) => CheckDistanceModel(
    status: json["status"],
    deliveryPrice: json["deliveryPrice"] ?? 0,
    distance: json["distance"] == null ? 0.0 : json["distance"].toDouble(),
    message: json["message"] ?? '',
    maxRange: json["maxRange"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "deliveryPrice": deliveryPrice ?? 0,
    "distance": distance ?? 0.0,
    "message": message ?? '',
    "maxRange": maxRange ?? 0,
  };
}
