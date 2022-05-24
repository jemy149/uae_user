import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';
import 'package:uae_user/data/models/user_models/addresses/delete_address_model.dart';
import 'package:uae_user/data/models/user_models/addresses/my_addresses_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class DeleteAddressRequest {
  Future deleteAddressRequest({
  required int locationId
}
      ) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_DELETE_ADDRESSES, data: {
        'locationId': locationId,
        'apiToken': apiToken,
      });
      printResponse(response.data.toString());
      return DeleteAddressModel.fromJson(response.data);
    } catch (error) {
      printError("deleteAddressRequest "+error.toString());
      return null;
    }
  }
}
