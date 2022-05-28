class MakeOrderLocation {
  MakeOrderLocation({
    this.longitude,
    this.latitude,
    this.address,
  });

  double? longitude;
  double? latitude;
  String? address;

  factory MakeOrderLocation.fromJson(Map<String, dynamic> json) => MakeOrderLocation(
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
    "address": address,
  };
}