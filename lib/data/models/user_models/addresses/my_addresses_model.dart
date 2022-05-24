import 'dart:convert';

import '../../shared_models/shared_classes/api_address.dart';

MyAddressesModel myAddressesModelFromJson(String str) =>
    MyAddressesModel.fromJson(json.decode(str));

String myAddressesModelToJson(MyAddressesModel data) =>
    json.encode(data.toJson());

class MyAddressesModel {
  MyAddressesModel({
    int? status,
    int? totalPages,
    List<ApiAddress>? myAddress,
  }) {
    _status = status;
    _totalPages = totalPages;
    _myAddress = myAddress;
  }

  MyAddressesModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalPages = json['totalPages'];
    if (json['myAddress'] != null) {
      _myAddress = [];
      json['myAddress'].forEach((v) {
        _myAddress?.add(ApiAddress.fromJson(v));
      });
    }
  }

  int? _status;
  int? _totalPages;
  List<ApiAddress>? _myAddress;

  int get status => _status ?? 0;

  int get totalPages => _totalPages ?? 0;

  List<ApiAddress> get myAddress => _myAddress ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalPages'] = _totalPages;
    if (_myAddress != null) {
      map['myAddress'] = _myAddress?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}


