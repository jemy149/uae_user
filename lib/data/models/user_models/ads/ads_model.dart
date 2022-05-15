import 'dart:convert';

AdsModel adsModelFromJson(String str) => AdsModel.fromJson(json.decode(str));

String adsModelToJson(AdsModel data) => json.encode(data.toJson());

class AdsModel {
  AdsModel({
    this.status,
    this.totalPages,
    this.ads,
  });

  int? status;
  int? totalPages;
  List<Ad>? ads;

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
    status: json["status"],
    totalPages: json["totalPages"],
    ads: List<Ad>.from(json["Ads"].map((x) => Ad.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalPages": totalPages,
    "Ads": List<dynamic>.from(ads!.map((x) => x.toJson())),
  };
}

class Ad {
  Ad({
    this.id,
    this.title,
    this.screen,
    this.screenCategory,
    this.screenStore,
    this.action,
    this.actionProduct,
    this.actionStore,
    this.actionCategory,
    this.image,
  });

  int? id;
  String? title;
  String? screen;
  NCategory? screenCategory;
  Store? screenStore;
  String? action;
  ActionProduct? actionProduct;
  Store? actionStore;
  NCategory? actionCategory;
  String? image;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    id: json["id"],
    title: json["title"],
    screen: json["screen"],
    screenCategory: NCategory.fromJson(json["screen-category"]),
    screenStore: Store.fromJson(json["screen-store"]),
    action: json["action"],
    actionProduct: ActionProduct.fromJson(json["action-product"]),
    actionStore: Store.fromJson(json["action-store"]),
    actionCategory: NCategory.fromJson(json["action-category"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "screen": screen,
    "screen-category": screenCategory!.toJson(),
    "screen-store": screenStore!.toJson(),
    "action": action,
    "action-product": actionProduct!.toJson(),
    "action-store": actionStore!.toJson(),
    "action-category": actionCategory!.toJson(),
    "image": image,
  };
}

class NCategory {
  NCategory({
    this.id,
    this.type,
    this.name,
    this.image,
  });

  int? id;
  String? type;
  String? name;
  String? image;

  factory NCategory.fromJson(Map<String, dynamic> json) => NCategory(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "image": image,
  };
}

class ActionProduct {
  ActionProduct({
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

  factory ActionProduct.fromJson(Map<String, dynamic> json) => ActionProduct(
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
