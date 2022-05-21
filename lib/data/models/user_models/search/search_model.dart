import 'dart:convert';
SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));
String searchModelToJson(SearchModel data) => json.encode(data.toJson());
class SearchModel {
  SearchModel({
      int? status, 
      int? totalPages, 
      List<Products>? products,}){
    _status = status;
    _totalPages = totalPages;
    _products = products;
}

  SearchModel.fromJson(dynamic json) {
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

  int get status => _status ?? 0;
  int get totalPages => _totalPages ?? 0;
  List<Products> get products => _products ?? [];

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
      double? price, 
      bool? isFreeDelivered, 
      List<String>? images, 
      dynamic store, 
      int? quantity, 
      // List<dynamic>? prices,
      bool? hasOffer, 
      int? point, 
      // List<dynamic>? features,
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
    // _prices = prices;
    _hasOffer = hasOffer;
    _point = point;
    // _features = features;
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
    _store = json['store'];
    _quantity = json['quantity'];
    if (json['prices'] != null) {
      _prices = [];
      // json['prices'].forEach((v) {
      //   _prices?.add(Dynamic.fromJson(v));
      // });
    }
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
  List<dynamic>? _prices;
  bool? _hasOffer;
  int? _point;
  List<dynamic>? _features;
  int? _viewers;

  int get id => _id ?? 0;
  String get barcode => _barcode ?? '';
  String get name => _name ?? '';
  String get description => _description ?? '';
  double get price => _price ?? 0.0;
  bool get isFreeDelivered => _isFreeDelivered ?? false;
  List<String> get images => _images ?? [];
  dynamic get store => _store;
  int get quantity => _quantity ?? 0;
  // List<dynamic> get prices => _prices;
  bool get hasOffer => _hasOffer ?? false;
  int get point => _point ?? 0;
  // List<dynamic>? get features => _features;
  int? get viewers => _viewers;

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
    if (_prices != null) {
      map['prices'] = _prices?.map((v) => v.toJson()).toList();
    }
    map['hasOffer'] = _hasOffer;
    map['point'] = _point;
    if (_features != null) {
      map['features'] = _features?.map((v) => v.toJson()).toList();
    }
    map['viewers'] = _viewers;
    return map;
  }

}