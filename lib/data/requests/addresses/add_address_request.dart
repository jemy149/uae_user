import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';
import 'package:uae_user/data/models/user_models/addresses/add_address_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class AddAddressesRequest {
   Future addAddressesRequest({
     int? locationId,
    required num locationLongitude,
    required num locationLatitude,
    required String locationAddress,
    required int isDefaultAddress,
    required String description,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_ADD_ADDRESSES, data: {
        'apiToken': apiToken,
        'description': description,
        'isDefaultAddress': isDefaultAddress,
        'location[longitude]': locationLongitude,
        'location[latitude]': locationLatitude,
        'location[address]': locationAddress,
        'locationId': locationId,
      });
      printResponse(response.data.toString());
      return AddAddressModel.fromJson(response.data);
    } catch (error) {
      printError("addAddressesRequest "+error.toString());
      return null;
    }
  }
}
