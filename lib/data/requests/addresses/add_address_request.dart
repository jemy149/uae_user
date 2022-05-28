import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';
import 'package:uae_user/data/models/user_models/addresses/add_address_model.dart';
import 'package:uae_user/data/requests/make_order/make_order_request/order_location_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class AddAndEditAddressesRequest {
  Future addAndEditAddressesRequest({
    int? locationId,
    required num locationLongitude,
    required num locationLatitude,
    required String locationAddress,
    required int isDefaultAddress,
    String? description,
  }) async {
    try {
      Response response =
          await DioHelper.postData(url: EP_USER_ADD_ADDRESSES, data: {
        'apiToken': apiToken,
        'description': description,
        'isDefaultAddress': isDefaultAddress,
        'location': MakeOrderLocation(
            address: locationAddress,
            latitude: locationLatitude.toDouble(),
            longitude: locationLongitude.toDouble()).toJson(),
        'locationId': locationId,
      });
      printResponse(response.data.toString());
      return AddAndEditAddressModel.fromJson(response.data);
    } catch (error) {
      printError("addAndEditAddressesRequest " + error.toString());
      return null;
    }
  }
}
