import 'package:uae_user/data/requests/make_order/check_distance_request/cart_item_model/feature_model.dart';

class CartItem {
  CartItem({
    this.productId,
    this.quantity,
    this.features,
  });

  int? productId;
  int? quantity;
  List<Feature>? features;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    productId: json["productId"],
    quantity: json["quantity"],
    features: List<Feature>.from(json["features"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "quantity": quantity,
    "features": List<dynamic>.from(features!.map((x) => x)),
  };
}