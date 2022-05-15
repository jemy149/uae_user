import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.status,
    this.totalPages,
    this.products,
  });

  int? status;
  int? totalPages;
  List<Product>? products;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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
    this.prices,
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
  List<dynamic>? prices;
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
    prices: List<dynamic>.from(json["prices"].map((x) => x)),
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
    "prices": List<dynamic>.from(prices!.map((x) => x)),
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
  Name? name;
  Location? location;
  dynamic category;
  String? image;
  int? rate;
  DeliveryTime? deliveryTime;
  int? fees;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: nameValues.map![json["name"]]!,
    location: Location.fromJson(json["location"]),
    category: json["category"],
    image: json["image"],
    rate: json["rate"],
    deliveryTime: deliveryTimeValues.map![json["deliveryTime"]]!,
    fees: json["fees"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse![name],
    "location": location!.toJson(),
    "category": category,
    "image": image,
    "rate": rate,
    "deliveryTime": deliveryTimeValues.reverse![deliveryTime],
    "fees": fees,
  };
}

enum DeliveryTime { EMPTY }

final deliveryTimeValues = EnumValues({
  " دقائق": DeliveryTime.EMPTY
});

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
  Address? address;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
    address: addressValues.map![json["address"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "longitude": longitude,
    "latitude": latitude,
    "address": addressValues.reverse![address],
  };
}

enum Address { EMPTY }

final addressValues = EnumValues({
  "الامارات": Address.EMPTY
});

enum Name { UAESTORE }

final nameValues = EnumValues({
  "uaestore": Name.UAESTORE
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
