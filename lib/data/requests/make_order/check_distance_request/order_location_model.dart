class Location {
  Location({
    this.longitude,
    this.latitude,
    this.address,
  });

  double? longitude;
  double? latitude;
  String? address;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
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