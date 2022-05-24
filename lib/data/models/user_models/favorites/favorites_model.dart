import 'dart:convert';

import 'package:uae_user/data/models/shared_models/shared_classes/api_location.dart';
FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));
String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());
class FavoriteModel {
  FavoriteModel({
    int? status,
    int? totalPages,
    List<Products>? products,}){
    _status = status;
    _totalPages = totalPages;
    _products = products;
  }

  FavoriteModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalPages = json['totalPages'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  int? _status;
  int? _totalPages;
  List<Products>? _products;

  int get status => _status??0;
  int get totalPages => _totalPages??0;
  List<Products> get products => _products??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalPages'] = _totalPages;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
    int? id,
    String? barcode,
    String? name,
    String? description,
    num? price,
    bool? isFreeDelivered,
    List<String>? images,
    Store? store,
    int? quantity,
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
    _prices = prices;
    _isFav = isFav;
    _hasOffer = hasOffer;
    _point = point;
    _features = features;
    _viewers = viewers;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _barcode = json['barcode'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _isFreeDelivered = json['isFreeDelivered'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _store = json['store'] != null ? Store.fromJson(json['store']) : null;
    _quantity = json['quantity'];
    if (json['prices'] != null) {
      _prices = [];
      json['prices'].forEach((v) {
        //  _prices?.add(Dynamic.fromJson(v));
      });
    }
    _isFav = json['isFav'];
    _hasOffer = json['hasOffer'];
    _point = json['point'];
    if (json['features'] != null) {
      _features = [];
      json['features'].forEach((v) {
        // _features?.add(Dynamic.fromJson(v));
      });
    }
    _viewers = json['viewers'];
  }
  int? _id;
  String? _barcode;
  String? _name;
  String? _description;
  num? _price;
  bool? _isFreeDelivered;
  List<String>? _images;
  Store? _store;
  int? _quantity;
  List<dynamic>? _prices;
  bool? _isFav;
  bool? _hasOffer;
  int? _point;
  List<dynamic>? _features;
  int? _viewers;

  int get id => _id??0;
  String get barcode => _barcode??'';
  String get name => _name??'';
  String get description => _description??'';
  num get price => _price??0;
  bool get isFreeDelivered => _isFreeDelivered??false;
  List<String> get images => _images??[];
  Store get store => _store??Store();
  int get quantity => _quantity??0;
  List<dynamic> get prices => _prices??[];
  bool get isFav => _isFav??false;
  bool get hasOffer => _hasOffer??false;
  int get point => _point??0;
  List<dynamic> get features => _features??[];
  int get viewers => _viewers??0;

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

Store storeFromJson(String str) => Store.fromJson(json.decode(str));
String storeToJson(Store data) => json.encode(data.toJson());
class Store {
  Store({
    int? id,
    String? name,
    ApiLocation? location,
    String? category,
    String? image,
    num? rate,
    String? deliveryTime,
    num? fees,}){
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
    _location = json['location'] != null ? ApiLocation.fromJson(json['location']) : null;
    _category = json['category'];
    _image = json['image'];
    _rate = json['rate'];
    _deliveryTime = json['deliveryTime'];
    _fees = json['fees'];
  }
  int? _id;
  String? _name;
  ApiLocation? _location;
  String? _category;
  String? _image;
  num? _rate;
  String? _deliveryTime;
  num? _fees;

  int get id => _id??0;
  String get name => _name??"";
  ApiLocation get location => _location??ApiLocation();
  String get category => _category??"";
  String get image => _image??"";
  num get rate => _rate??0;
  String get deliveryTime => _deliveryTime??"";
  num get fees => _fees??0;

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

