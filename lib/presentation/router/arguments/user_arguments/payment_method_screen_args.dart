import 'package:uae_user/data/models/user_models/addresses/my_addresses_model.dart';
import 'package:uae_user/data/models/user_models/make_order/check_distance_model.dart';

import '../../../../data/models/shared_models/shared_classes/api_address.dart';
import '../../../../data/models/user_models/cart/get_my_cart_model.dart';

class PaymentMethodScreenArgs{
  final GetMyCartModel getMyCartModel;
  final String address;
  final String phone;
  final String email;
  final String name;
  final String? additionalInstructions;
  final int? index;
  final CheckDistanceModel checkDistanceModel;
  final MyAddressesModel? myAddressesModel;
  final ApiAddress? apiAddress;

  PaymentMethodScreenArgs(
      { this.apiAddress, this.myAddressesModel, required this.checkDistanceModel, required this.getMyCartModel,
      required this.address,
      required this.phone,
      required this.email,
      required this.name,
       this.additionalInstructions, this.index, });

}