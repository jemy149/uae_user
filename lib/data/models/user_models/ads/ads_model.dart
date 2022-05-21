import 'dart:convert';

import '../../shared_models/shared_classes/api_location.dart';
AdsModel adsModelFromJson(String str) => AdsModel.fromJson(json.decode(str));
String adsModelToJson(AdsModel data) => json.encode(data.toJson());
class AdsModel {
  AdsModel({
      int? status, 
      int? totalPages, 
      List<Ads>? ads,}){
    _status = status;
    _totalPages = totalPages;
    _ads = ads;
}

  AdsModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalPages = json['totalPages'];
    if (json['Ads'] != null) {
      _ads = [];
      json['Ads'].forEach((v) {
        _ads?.add(Ads.fromJson(v));
      });
    }
  }
  int? _status;
  int? _totalPages;
  List<Ads>? _ads;

  int get status => _status ?? 0;
  int get totalPages => _totalPages ?? 0;
  List<Ads> get ads => _ads ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalPages'] = _totalPages;
    if (_ads != null) {
      map['Ads'] = _ads?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));
String adsToJson(Ads data) => json.encode(data.toJson());
class Ads {
  Ads({
      int? id, 
      String? title, 
      String? screen, 
      ScreenCategory? screencategory, 
      ScreenStore? screenstore, 
      String? action, 
      ActionProduct? actionproduct, 
      ActionStore? actionstore, 
      ActionCategory? actioncategory, 
      String? image,}){
    _id = id;
    _title = title;
    _screen = screen;
    _screencategory = screencategory;
    _screenstore = screenstore;
    _action = action;
    _actionproduct = actionproduct;
    _actionstore = actionstore;
    _actioncategory = actioncategory;
    _image = image;
}

  Ads.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _screen = json['screen'];
    _screencategory = json['screen-category'] != null ? ScreenCategory.fromJson(json['screen-category']) : null;
    _screenstore = json['screen-store'] != null ? ScreenStore.fromJson(json['screen-store']) : null;
    _action = json['action'];
    _actionproduct = json['action-product'] != null ? ActionProduct.fromJson(json['action-product']) : null;
    _actionstore = json['action-store'] != null ? ActionStore.fromJson(json['action-store']) : null;
    _actioncategory = json['action-category'] != null ? ActionCategory.fromJson(json['action-category']) : null;
    _image = json['image'];
  }
  int? _id;
  String? _title;
  String? _screen;
  ScreenCategory? _screencategory;
  ScreenStore? _screenstore;
  String? _action;
  ActionProduct? _actionproduct;
  ActionStore? _actionstore;
  ActionCategory? _actioncategory;
  String? _image;

  int get id => _id ?? 0;
  String get title => _title ?? '';
  String get screen => _screen ?? '';
  ScreenCategory get screencategory => _screencategory ?? ScreenCategory();
  ScreenStore get screenstore => _screenstore ?? ScreenStore();
  String get action => _action ?? '';
  ActionProduct get actionproduct => _actionproduct ?? ActionProduct();
  ActionStore get actionstore => _actionstore ?? ActionStore();
  ActionCategory get actioncategory => _actioncategory ?? ActionCategory();
  String get image => _image ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['screen'] = _screen;
    if (_screencategory != null) {
      map['screen-category'] = _screencategory?.toJson();
    }
    if (_screenstore != null) {
      map['screen-store'] = _screenstore?.toJson();
    }
    map['action'] = _action;
    if (_actionproduct != null) {
      map['action-product'] = _actionproduct?.toJson();
    }
    if (_actionstore != null) {
      map['action-store'] = _actionstore?.toJson();
    }
    if (_actioncategory != null) {
      map['action-category'] = _actioncategory?.toJson();
    }
    map['image'] = _image;
    return map;
  }

}

ActionCategory actionCategoryFromJson(String str) => ActionCategory.fromJson(json.decode(str));
String actionCategoryToJson(ActionCategory data) => json.encode(data.toJson());
class ActionCategory {
  ActionCategory({
      int? id, 
      String? type, 
      String? name, 
      String? image,}){
    _id = id;
    _type = type;
    _name = name;
    _image = image;
}

  ActionCategory.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _name = json['name'];
    _image = json['image'];
  }
  int? _id;
  String? _type;
  String? _name;
  String? _image;

  int get id => _id ?? 0;
  String get type => _type ?? '';
  String get name => _name ?? '';
  String get image => _image ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}

ActionStore actionStoreFromJson(String str) => ActionStore.fromJson(json.decode(str));
String actionStoreToJson(ActionStore data) => json.encode(data.toJson());
class ActionStore {
  ActionStore({
      int? id, 
      String? name, 
      ApiLocation? location,
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

  ActionStore.fromJson(dynamic json) {
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
  dynamic _category;
  String? _image;
  int? _rate;
  String? _deliveryTime;
  int? _fees;

  int get id => _id ?? 0;
  String get name => _name ?? '';
  ApiLocation get location => _location ?? ApiLocation();
  dynamic get category => _category ;
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



ActionProduct actionProductFromJson(String str) => ActionProduct.fromJson(json.decode(str));
String actionProductToJson(ActionProduct data) => json.encode(data.toJson());
class ActionProduct {
  ActionProduct({
      int? id, 
      String? barcode, 
      String? name, 
      String? description, 
      num? price,
      bool? isFreeDelivered, 
      List<String>? images, 
      Store? store, 
      int? quantity, 
      List<Prices>? prices, 
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
    _prices = prices;
    _hasOffer = hasOffer;
    _point = point;
    // _features = features;
    _viewers = viewers;
}

  ActionProduct.fromJson(dynamic json) {
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
        _prices?.add(Prices.fromJson(v));
      });
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
  num? _price;
  bool? _isFreeDelivered;
  List<String>? _images;
  Store? _store;
  int? _quantity;
  List<Prices>? _prices;
  bool? _hasOffer;
  int? _point;
  // List<dynamic>? _features;
  int? _viewers;

  int get id => _id ?? 0;
  String get barcode => _barcode ?? '';
  String get name => _name ?? '';
  String get description => _description ?? '';
  num get price => _price ?? 0;
  bool get isFreeDelivered => _isFreeDelivered ?? false;
  List<String> get images => _images ?? [];
  Store get store => _store ?? Store();
  int get quantity => _quantity ?? 0;
  List<Prices> get prices => _prices ?? [];
  bool get hasOffer => _hasOffer ?? false;
  int get point => _point ?? 0;
  // List<dynamic> get features => _features ?? [];
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
    if (_prices != null) {
      map['prices'] = _prices?.map((v) => v.toJson()).toList();
    }
    map['hasOffer'] = _hasOffer;
    map['point'] = _point;
    // if (_features != null) {
    //   map['features'] = _features?.map((v) => v.toJson()).toList();
    // }
    map['viewers'] = _viewers;
    return map;
  }

}

Prices pricesFromJson(String str) => Prices.fromJson(json.decode(str));
String pricesToJson(Prices data) => json.encode(data.toJson());
class Prices {
  Prices({
      int? id, 
      int? price, 
      int? quantity, 
      String? image,}){
    _id = id;
    _price = price;
    _quantity = quantity;
    _image = image;
}

  Prices.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _quantity = json['quantity'];
    _image = json['image'];
  }
  int? _id;
  int? _price;
  int? _quantity;
  String? _image;

  int get id => _id ?? 0;
  int get price => _price ?? 0;
  int get quantity => _quantity ?? 0;
  String get image => _image ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['image'] = _image;
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
  dynamic _category;
  String? _image;
  int? _rate;
  String? _deliveryTime;
  int? _fees;

  int get id => _id ?? 0;
  String get name => _name ?? '';
  ApiLocation get location => _location ?? ApiLocation();
  dynamic get category => _category;
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



ScreenStore screenStoreFromJson(String str) => ScreenStore.fromJson(json.decode(str));
String screenStoreToJson(ScreenStore data) => json.encode(data.toJson());
class ScreenStore {
  ScreenStore({
      int? id, 
      String? name, 
      ApiLocation? location,
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

  ScreenStore.fromJson(dynamic json) {
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
  dynamic _category;
  String? _image;
  int? _rate;
  String? _deliveryTime;
  int? _fees;

  int get id => _id ?? 0;
  String get name => _name ?? '';
  ApiLocation get location => _location ?? ApiLocation();
  dynamic get category => _category;
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


ScreenCategory screenCategoryFromJson(String str) => ScreenCategory.fromJson(json.decode(str));
String screenCategoryToJson(ScreenCategory data) => json.encode(data.toJson());
class ScreenCategory {
  ScreenCategory({
      int? id, 
      String? type, 
      String? name, 
      String? image,}){
    _id = id;
    _type = type;
    _name = name;
    _image = image;
}

  ScreenCategory.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _name = json['name'];
    _image = json['image'];
  }
  int? _id;
  String? _type;
  String? _name;
  String? _image;

  int get id => _id ?? 0;
  String get type => _type ?? '';
  String get name => _name ?? '';
  String get image => _image ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}