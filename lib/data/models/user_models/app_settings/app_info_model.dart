import 'dart:convert';

AppInfoModel appInfoModelFromJson(String str) => AppInfoModel.fromJson(json.decode(str));

String appInfoModelToJson(AppInfoModel data) => json.encode(data.toJson());

class AppInfoModel {
  AppInfoModel({
    this.status,
    this.appInfo,
  });

  int? status;
  AppInfo? appInfo;

  factory AppInfoModel.fromJson(Map<String, dynamic> json) => AppInfoModel(
    status: json["status"],
    appInfo: AppInfo.fromJson(json["appInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "appInfo": appInfo!.toJson(),
  };
}

class AppInfo {
  AppInfo({
    this.email,
    this.phones,
    this.welcome,
    this.about,
    this.policy,
    this.privacy,
    this.registerPoints,
    this.firstOrderPoints,
    this.pricePerKm,
    this.feesOfCancellation,
    this.pricePer20Km,
  });

  List<String>? email;
  List<String>? phones;
  String? welcome;
  String? about;
  String? policy;
  String? privacy;
  int? registerPoints;
  int? firstOrderPoints;
  int? pricePerKm;
  int? feesOfCancellation;
  double? pricePer20Km;

  factory AppInfo.fromJson(Map<String, dynamic> json) => AppInfo(
    email: List<String>.from(json["email"].map((x) => x)),
    phones: List<String>.from(json["phones"].map((x) => x)),
    welcome: json["welcome"],
    about: json["about"],
    policy: json["policy"],
    privacy: json["privacy"],
    registerPoints: json["registerPoints"],
    firstOrderPoints: json["firstOrderPoints"],
    pricePerKm: json["pricePerKM"],
    feesOfCancellation: json["feesOfCancellation"],
    pricePer20Km: json["pricePer20Km"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "email": List<dynamic>.from(email!.map((x) => x)),
    "phones": List<dynamic>.from(phones!.map((x) => x)),
    "welcome": welcome,
    "about": about,
    "policy": policy,
    "privacy": privacy,
    "registerPoints": registerPoints,
    "firstOrderPoints": firstOrderPoints,
    "pricePerKM": pricePerKm,
    "feesOfCancellation": feesOfCancellation,
    "pricePer20Km": pricePer20Km,
  };
}
