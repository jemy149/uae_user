import 'dart:convert';
GetOffersModel getOffersFromJson(String str) => GetOffersModel.fromJson(json.decode(str));
String getOffersToJson(GetOffersModel data) => json.encode(data.toJson());
class GetOffersModel {
  GetOffersModel({
      int? status, 
      int? totalPages, 
      List<Offers>? offers,}){
    _status = status;
    _totalPages = totalPages;
    _offers = offers;
}

  GetOffersModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalPages = json['totalPages'];
    if (json['offers'] != null) {
      _offers = [];
      json['offers'].forEach((v) {
        _offers?.add(Offers.fromJson(v));
      });
    }
  }
  int? _status;
  int? _totalPages;
  List<Offers>? _offers;

  int get status => _status ?? 0;
  int get totalPages => _totalPages ?? 0;
  List<Offers> get offers => _offers ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalPages'] = _totalPages;
    if (_offers != null) {
      map['offers'] = _offers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Offers offersFromJson(String str) => Offers.fromJson(json.decode(str));
String offersToJson(Offers data) => json.encode(data.toJson());
class Offers {
  Offers({
      int? id, 
      Product? product, 
      int? discount, 
      String? discountStr, 
      double? price,}){
    _id = id;
    _product = product;
    _discount = discount;
    _discountStr = discountStr;
    _price = price;
}

  Offers.fromJson(dynamic json) {
    _id = json['id'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
    _discount = json['discount'];
    _discountStr = json['discountStr'];
    _price = json['price'];
  }
  int? _id;
  Product? _product;
  int? _discount;
  String? _discountStr;
  double? _price;

  int get id => _id ?? 0;
  Product get product => _product ?? Product();
  int get discount => _discount ?? 0;
  String get discountStr => _discountStr ?? '';
  double get price => _price ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    map['discount'] = _discount;
    map['discountStr'] = _discountStr;
    map['price'] = _price;
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
      Store? store, 
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
    _store = json['store'] != null ? Store.fromJson(json['store']) : null;
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
  Store? _store;
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
  Store get store => _store ?? Store();
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
    if (_store != null) {
      map['store'] = _store?.toJson();
    }
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

Store storeFromJson(String str) => Store.fromJson(json.decode(str));
String storeToJson(Store data) => json.encode(data.toJson());
class Store {
  Store({
      int? id, 
      String? name, 
      Location? location, 
      dynamic category, 
      String? image, 
      int? rate, 
      String? deliveryTime, 
      int? fees,}){
    _id = id;
    _name = name;
    _location = location;
    _category = category;
    _image = image;
    _rate = rate;
    _deliveryTime = deliveryTime;
    _fees = fees;
}

  Store.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _category = json['category'];
    _image = json['image'];
    _rate = json['rate'];
    _deliveryTime = json['deliveryTime'];
    _fees = json['fees'];
  }
  int? _id;
  String? _name;
  Location? _location;
  dynamic _category;
  String? _image;
  int? _rate;
  String? _deliveryTime;
  int? _fees;

  int get id => _id ?? 0;
  String get name => _name ?? '';
  Location get location => _location ?? Location();
  dynamic get category => _category ?? [];
  String get image => _image ?? '';
  int get rate => _rate ?? 0;
  String get deliveryTime => _deliveryTime ?? '';
  int get fees => _fees ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['category'] = _category;
    map['image'] = _image;
    map['rate'] = _rate;
    map['deliveryTime'] = _deliveryTime;
    map['fees'] = _fees;
    return map;
  }

}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
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

  Location.fromJson(dynamic json) {
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