import 'dart:convert';

MakeOrderModel makeOrderModelFromJson(String str) => MakeOrderModel.fromJson(json.decode(str));

String makeOrderModelToJson(MakeOrderModel data) => json.encode(data.toJson());

class MakeOrderModel {
  MakeOrderModel({
    this.status,
    this.order,
    this.message,
  });

  int? status;
  Order? order;
  String? message;

  factory MakeOrderModel.fromJson(Map<String, dynamic> json) => MakeOrderModel(
    status: json["status"],
    order: Order.fromJson(json["order"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "order": order!.toJson(),
    "message": message,
  };
}

class Order {
  Order({
    this.id,
    this.orderLocation,
    this.createdAt,
    this.status,
    this.code,
    this.user,
    this.usersId,
    this.store,
    this.carts,
    this.deliveryTime,
    this.paymentMethod,
    this.bill,
    this.freeDelivery,
    this.pushAfter3Day,
  });

  int? id;
  Location? orderLocation;
  int? createdAt;
  String? status;
  String? code;
  User? user;
  int? usersId;
  Store? store;
  List<Cart>? carts;
  DateTime? deliveryTime;
  String? paymentMethod;
  Bill? bill;
  bool? freeDelivery;
  bool? pushAfter3Day;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    orderLocation: Location.fromJson(json["orderLocation"]),
    createdAt: json["createdAt"],
    status: json["status"],
    code: json["code"],
    user: User.fromJson(json["user"]),
    usersId: json["users_id"],
    store: Store.fromJson(json["store"]),
    carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
    deliveryTime: DateTime.parse(json["deliveryTime"]),
    paymentMethod: json["paymentMethod"],
    bill: Bill.fromJson(json["bill"]),
    freeDelivery: json["freeDelivery"],
    pushAfter3Day: json["pushAfter3Day"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderLocation": orderLocation!.toJson(),
    "createdAt": createdAt,
    "status": status,
    "code": code,
    "user": user!.toJson(),
    "users_id": usersId,
    "store": store!.toJson(),
    "carts": List<dynamic>.from(carts!.map((x) => x.toJson())),
    "deliveryTime": "${deliveryTime!.year.toString().padLeft(4, '0')}-${deliveryTime!.month.toString().padLeft(2, '0')}-${deliveryTime!.day.toString().padLeft(2, '0')}",
    "paymentMethod": paymentMethod,
    "bill": bill!.toJson(),
    "freeDelivery": freeDelivery,
    "pushAfter3Day": pushAfter3Day,
  };
}

class Bill {
  Bill({
    this.deliveryPrice,
    this.productsPrice,
    this.fees,
    this.discounted,
    this.totalPrice,
  });

  int? deliveryPrice;
  double? productsPrice;
  dynamic fees;
  dynamic discounted;
  double? totalPrice;

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
    deliveryPrice: json["deliveryPrice"],
    productsPrice: json["productsPrice"].toDouble(),
    fees: json["fees"],
    discounted: json["discounted"],
    totalPrice: json["totalPrice"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "deliveryPrice": deliveryPrice,
    "productsPrice": productsPrice,
    "fees": fees,
    "discounted": discounted,
    "totalPrice": totalPrice,
  };
}

class Cart {
  Cart({
    this.id,
    this.product,
    this.productId,
    this.quantity,
    this.description,
    this.features,
  });

  int? id;
  Product? product;
  int? productId;
  int? quantity;
  dynamic description;
  List<dynamic>? features;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    product: Product.fromJson(json["product"]),
    productId: json["productId"],
    quantity: json["quantity"],
    description: json["description"],
    features: List<dynamic>.from(json["features"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product!.toJson(),
    "productId": productId,
    "quantity": quantity,
    "description": description,
    "features": List<dynamic>.from(features!.map((x) => x)),
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

class User {
  User({
    this.id,
    this.name,
    this.phone,
    this.rate,
  });

  int? id;
  String? name;
  String? phone;
  int? rate;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "rate": rate,
  };
}
