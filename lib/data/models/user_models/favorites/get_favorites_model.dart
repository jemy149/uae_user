import 'dart:convert';

GetFavoritesModel getFavoritesModelFromJson(String str) => GetFavoritesModel.fromJson(json.decode(str));

String getFavoritesModelToJson(GetFavoritesModel data) => json.encode(data.toJson());

class GetFavoritesModel {
  GetFavoritesModel({
    this.status,
    this.totalPages,
    this.products,
  });

  int? status;
  int? totalPages;
  List<Product>? products;

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) => GetFavoritesModel(
    status: json["status"],
    totalPages: json["totalPages"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalPages": totalPages,
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.isFreeDelivered,
    this.images,
    this.store,
    this.quantity,
    this.isFav,
    this.hasOffer,
    this.point,
    this.features,
    this.viewers,
  });

  int? id;
  String? name;
  String? description;
  double? price;
  bool? isFreeDelivered;
  List<String>? images;
  Store? store;
  int? quantity;
  bool? isFav;
  bool? hasOffer;
  int? point;
  List<dynamic>? features;
  int? viewers;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"].toDouble(),
    isFreeDelivered: json["isFreeDelivered"],
    images: List<String>.from(json["images"].map((x) => x)),
    store: Store.fromJson(json["store"]),
    quantity: json["quantity"],
    isFav: json["isFav"],
    hasOffer: json["hasOffer"],
    point: json["point"],
    features: List<dynamic>.from(json["features"].map((x) => x)),
    viewers: json["viewers"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "isFreeDelivered": isFreeDelivered,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "store": store!.toJson(),
    "quantity": quantity,
    "isFav": isFav,
    "hasOffer": hasOffer,
    "point": point,
    "features": List<dynamic>.from(features!.map((x) => x)),
    "viewers": viewers,
  };
}

class Store {
  Store({
    this.id,
    this.name,
    this.location,
    this.category,
    this.image,
    this.rate,
    this.deliveryTime,
    this.fees,
  });

  int? id;
  String? name;
  Location? location;
  dynamic category;
  String? image;
  int? rate;
  String? deliveryTime;
  int? fees;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    location: Location.fromJson(json["location"]),
    category: json["category"],
    image: json["image"],
    rate: json["rate"],
    deliveryTime: json["deliveryTime"],
    fees: json["fees"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "location": location!.toJson(),
    "category": category,
    "image": image,
    "rate": rate,
    "deliveryTime": deliveryTime,
    "fees": fees,
  };
}

class Location {
  Location({
    this.id,
    this.longitude,
    this.latitude,
    this.address,
  });

  int? id;
  double? longitude;
  double? latitude;
  String? address;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "longitude": longitude,
    "latitude": latitude,
    "address": address,
  };
}
