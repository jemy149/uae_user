import 'dart:convert';
WalletModel walletModelFromJson(String str) => WalletModel.fromJson(json.decode(str));
String walletModelToJson(WalletModel data) => json.encode(data.toJson());
class WalletModel {
  WalletModel({
      int? status, 
      Wallet? wallet,}){
    _status = status;
    _wallet = wallet;
}

  WalletModel.fromJson(dynamic json) {
    _status = json['status'];
    _wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
  }
  int? _status;
  Wallet? _wallet;

  int get status => _status ?? 0;
  Wallet get wallet => _wallet ?? Wallet();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_wallet != null) {
      map['wallet'] = _wallet?.toJson();
    }
    return map;
  }

}

Wallet walletFromJson(String str) => Wallet.fromJson(json.decode(str));
String walletToJson(Wallet data) => json.encode(data.toJson());
class Wallet {
  Wallet({
      String? points, 
      String? cashback, 
      String? balance,}){
    _points = points;
    _cashback = cashback;
    _balance = balance;
}

  Wallet.fromJson(dynamic json) {
    _points = json['points'];
    _cashback = json['cashback'];
    _balance = json['balance'];
  }
  String? _points;
  String? _cashback;
  String? _balance;

  String get points => _points ?? '';
  String get cashback => _cashback ?? '';
  String get balance => _balance ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['points'] = _points;
    map['cashback'] = _cashback;
    map['balance'] = _balance;
    return map;
  }

}