import 'dart:convert';
GetOrdersModel getOrdersModelFromJson(String str) => GetOrdersModel.fromJson(json.decode(str));
String getOrdersModelToJson(GetOrdersModel data) => json.encode(data.toJson());
class GetOrdersModel {
  GetOrdersModel({
      int? status, 
      int? totalPages, 
      List<Orders>? orders,}){
    _status = status;
    _totalPages = totalPages;
    _orders = orders;
}

  GetOrdersModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalPages = json['totalPages'];
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Orders.fromJson(v));
      });
    }
  }
  int? _status;
  int? _totalPages;
  List<Orders>? _orders;

  int get status => _status ?? 0;
  int get totalPages => _totalPages ?? 0;
  List<Orders> get orders => _orders ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalPages'] = _totalPages;
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));
String ordersToJson(Orders data) => json.encode(data.toJson());
class Orders {
  Orders({
      int? id, 
      OrderLocation? orderLocation, 
      int? createdAt, 
      String? status, 
      String? code, 
      User? user, 
      int? usersId, 
      dynamic store, 
      List<Carts>? carts, 
      String? deliveryTime, 
      String? paymentMethod, 
      Bill? bill, 
      bool? freeDelivery, 
      bool? pushAfter3Day,}){
    _id = id;
    _orderLocation = orderLocation;
    _createdAt = createdAt;
    _status = status;
    _code = code;
    _user = user;
    _usersId = usersId;
    _store = store;
    _carts = carts;
    _deliveryTime = deliveryTime;
    _paymentMethod = paymentMethod;
    _bill = bill;
    _freeDelivery = freeDelivery;
    _pushAfter3Day = pushAfter3Day;
}

  Orders.fromJson(dynamic json) {
    _id = json['id'];
    _orderLocation = json['orderLocation'] != null ? OrderLocation.fromJson(json['orderLocation']) : null;
    _createdAt = json['createdAt'];
    _status = json['status'];
    _code = json['code'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _usersId = json['users_id'];
    _store = json['store'];
    if (json['carts'] != null) {
      _carts = [];
      json['carts'].forEach((v) {
        _carts?.add(Carts.fromJson(v));
      });
    }
    _deliveryTime = json['deliveryTime'];
    _paymentMethod = json['paymentMethod'];
    _bill = json['bill'] != null ? Bill.fromJson(json['bill']) : null;
    _freeDelivery = json['freeDelivery'];
    _pushAfter3Day = json['pushAfter3Day'];
  }
  int? _id;
  OrderLocation? _orderLocation;
  int? _createdAt;
  String? _status;
  String? _code;
  User? _user;
  int? _usersId;
  dynamic _store;
  List<Carts>? _carts;
  String? _deliveryTime;
  String? _paymentMethod;
  Bill? _bill;
  bool? _freeDelivery;
  bool? _pushAfter3Day;

  int get id => _id ?? 0;
  OrderLocation get orderLocation => _orderLocation  ?? OrderLocation();
  int get createdAt => _createdAt ?? 0;
  String get status => _status ?? '';
  String get code => _code ?? '';
  User get user => _user ?? User();
  int get usersId => _usersId ?? 0;
  dynamic get store => _store ?? [];
  List<Carts> get carts => _carts ?? [];
  String get deliveryTime => _deliveryTime ?? '';
  String get paymentMethod => _paymentMethod ?? '';
  Bill get bill => _bill ?? Bill();
  bool get freeDelivery => _freeDelivery ?? false;
  bool get pushAfter3Day => _pushAfter3Day ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_orderLocation != null) {
      map['orderLocation'] = _orderLocation?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['status'] = _status;
    map['code'] = _code;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['users_id'] = _usersId;
    map['store'] = _store;
    if (_carts != null) {
      map['carts'] = _carts?.map((v) => v.toJson()).toList();
    }
    map['deliveryTime'] = _deliveryTime;
    map['paymentMethod'] = _paymentMethod;
    if (_bill != null) {
      map['bill'] = _bill?.toJson();
    }
    map['freeDelivery'] = _freeDelivery;
    map['pushAfter3Day'] = _pushAfter3Day;
    return map;
  }

}

Bill billFromJson(String str) => Bill.fromJson(json.decode(str));
String billToJson(Bill data) => json.encode(data.toJson());
class Bill {
  Bill({
      int? deliveryPrice, 
      double? productsPrice, 
      dynamic fees, 
      dynamic discounted, 
      double? totalPrice,}){
    _deliveryPrice = deliveryPrice;
    _productsPrice = productsPrice;
    _fees = fees;
    _discounted = discounted;
    _totalPrice = totalPrice;
}

  Bill.fromJson(dynamic json) {
    _deliveryPrice = json['deliveryPrice'];
    _productsPrice = json['productsPrice'];
    _fees = json['fees'];
    _discounted = json['discounted'];
    _totalPrice = json['totalPrice'];
  }
  int? _deliveryPrice;
  double? _productsPrice;
  dynamic _fees;
  dynamic _discounted;
  double? _totalPrice;

  int get deliveryPrice => _deliveryPrice ?? 0;
  double get productsPrice => _productsPrice ?? 0;
  dynamic get fees => _fees ?? [];
  dynamic get discounted => _discounted ?? [];
  double get totalPrice => _totalPrice ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deliveryPrice'] = _deliveryPrice;
    map['productsPrice'] = _productsPrice;
    map['fees'] = _fees;
    map['discounted'] = _discounted;
    map['totalPrice'] = _totalPrice;
    return map;
  }

}

Carts cartsFromJson(String str) => Carts.fromJson(json.decode(str));
String cartsToJson(Carts data) => json.encode(data.toJson());
class Carts {
  Carts({
      int? id, 
      Product? product, 
      int? productId, 
      int? quantity, 
      int? totalQuantity, 
      dynamic description, 
      double? price, 
      List<dynamic>? features,}){
    _id = id;
    _product = product;
    _productId = productId;
    _quantity = quantity;
    _totalQuantity = totalQuantity;
    _description = description;
    _price = price;
    _features = features;
}

  Carts.fromJson(dynamic json) {
    _id = json['id'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
    _productId = json['productId'];
    _quantity = json['quantity'];
    _totalQuantity = json['totalQuantity'];
    _description = json['description'];
    _price = json['price'];
    // if (json['features'] != null) {
    //   _features = [];
    //   json['features'].forEach((v) {
    //     _features?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  int? _id;
  Product? _product;
  int? _productId;
  int? _quantity;
  int? _totalQuantity;
  dynamic _description;
  double? _price;
  List<dynamic>? _features;

  int get id => _id ?? 0;
  Product get product => _product ?? Product();
  int get productId => _productId ?? 0;
  int get quantity => _quantity ?? 0;
  int get totalQuantity => _totalQuantity ?? 0;
  dynamic get description => _description ?? [];
  double get price => _price ?? 0;
  List<dynamic> get features => _features ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    map['productId'] = _productId;
    map['quantity'] = _quantity;
    map['totalQuantity'] = _totalQuantity;
    map['description'] = _description;
    map['price'] = _price;
    if (_features != null) {
      map['features'] = _features?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
      int? id, 
      String? barcode, 
      String? name, 
      String? description, 
      double? price, 
      bool? isFreeDelivered, 
      List<String>? images, 
      dynamic store, 
      int? quantity, 
      Brand? brand, 
      List<dynamic>? prices, 
      bool? isFav, 
      bool? hasOffer, 
      int? point, 
      List<dynamic>? features, 
      int? viewers,}){
    _id = id;
    _barcode = barcode;
    _name = name;
    _description = description;
    _price = price;
    _isFreeDelivered = isFreeDelivered;
    _images = images;
    _store = store;
    _quantity = quantity;
    _brand = brand;
    _prices = prices;
    _isFav = isFav;
    _hasOffer = hasOffer;
    _point = point;
    _features = features;
    _viewers = viewers;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _barcode = json['barcode'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _isFreeDelivered = json['isFreeDelivered'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _store = json['store'];
    _quantity = json['quantity'];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    // if (json['prices'] != null) {
    //   _prices = [];
    //   json['prices'].forEach((v) {
    //     _prices?.add(Dynamic.fromJson(v));
    //   });
    // }
    _isFav = json['isFav'];
    _hasOffer = json['hasOffer'];
    _point = json['point'];
    // if (json['features'] != null) {
    //   _features = [];
    //   json['features'].forEach((v) {
    //     _features?.add(Dynamic.fromJson(v));
    //   });
    // }
    _viewers = json['viewers'];
  }
  int? _id;
  String? _barcode;
  String? _name;
  String? _description;
  double? _price;
  bool? _isFreeDelivered;
  List<String>? _images;
  dynamic _store;
  int? _quantity;
  Brand? _brand;
  List<dynamic>? _prices;
  bool? _isFav;
  bool? _hasOffer;
  int? _point;
  List<dynamic>? _features;
  int? _viewers;

  int get id => _id ?? 0;
  String get barcode => _barcode ?? '';
  String get name => _name ?? '';
  String get description => _description ?? '';
  double get price => _price ?? 0;
  bool get isFreeDelivered => _isFreeDelivered ?? false;
  List<String> get images => _images ?? [];
  dynamic get store => _store ?? [];
  int get quantity => _quantity ?? 0;
  Brand get brand => _brand ?? Brand();
  List<dynamic> get prices => _prices ?? [];
  bool get isFav => _isFav ?? false;
  bool get hasOffer => _hasOffer ?? false;
  int get point => _point ?? 0;
  List<dynamic> get features => _features ?? [];
  int get viewers => _viewers ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['barcode'] = _barcode;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['isFreeDelivered'] = _isFreeDelivered;
    map['images'] = _images;
    map['store'] = _store;
    map['quantity'] = _quantity;
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_prices != null) {
      map['prices'] = _prices?.map((v) => v.toJson()).toList();
    }
    map['isFav'] = _isFav;
    map['hasOffer'] = _hasOffer;
    map['point'] = _point;
    if (_features != null) {
      map['features'] = _features?.map((v) => v.toJson()).toList();
    }
    map['viewers'] = _viewers;
    return map;
  }

}

Brand brandFromJson(String str) => Brand.fromJson(json.decode(str));
String brandToJson(Brand data) => json.encode(data.toJson());
class Brand {
  Brand({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;

  int get id => _id ?? 0;
  String get name => _name ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      int? id, 
      String? name, 
      String? phone, 
      String? image, 
      int? rate,}){
    _id = id;
    _name = name;
    _phone = phone;
    _image = image;
    _rate = rate;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _image = json['image'];
    _rate = json['rate'];
  }
  int? _id;
  String? _name;
  String? _phone;
  String? _image;
  int? _rate;

  int get id => _id ?? 0;
  String get name => _name ?? '';
  String get phone => _phone ?? '';
  String get image => _image ?? '';
  int get rate => _rate ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['image'] = _image;
    map['rate'] = _rate;
    return map;
  }

}

OrderLocation orderLocationFromJson(String str) => OrderLocation.fromJson(json.decode(str));
String orderLocationToJson(OrderLocation data) => json.encode(data.toJson());
class OrderLocation {
  OrderLocation({
      int? id, 
      double? longitude, 
      double? latitude, 
      String? address, 
      dynamic description, 
      int? isDefult, 
      String? createdAt, 
      bool? createdAtInt,}){
    _id = id;
    _longitude = longitude;
    _latitude = latitude;
    _address = address;
    _description = description;
    _isDefult = isDefult;
    _createdAt = createdAt;
    _createdAtInt = createdAtInt;
}

  OrderLocation.fromJson(dynamic json) {
    _id = json['id'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _address = json['address'];
    _description = json['description'];
    _isDefult = json['isDefult'];
    _createdAt = json['createdAt'];
    _createdAtInt = json['createdAtInt'];
  }
  int? _id;
  double? _longitude;
  double? _latitude;
  String? _address;
  dynamic _description;
  int? _isDefult;
  String? _createdAt;
  bool? _createdAtInt;

  int get id => _id ?? 0;
  double get longitude => _longitude ?? 0;
  double get latitude => _latitude ?? 0;
  String get address => _address ?? '';
  dynamic get description => _description ?? [];
  int get isDefult => _isDefult ?? 0;
  String get createdAt => _createdAt ?? '';
  bool get createdAtInt => _createdAtInt ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['address'] = _address;
    map['description'] = _description;
    map['isDefult'] = _isDefult;
    map['createdAt'] = _createdAt;
    map['createdAtInt'] = _createdAtInt;
    return map;
  }

}