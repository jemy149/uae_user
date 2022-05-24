import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';
import 'package:uae_user/data/models/user_models/addresses/my_addresses_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class MyAddressesRequest {
   Future myAddressesRequest(
  ) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_GET_MY_ADDRESSES, data: {
        'page': 0,
        'apiToken': apiToken,
      });
      printResponse(response.data.toString());
      return MyAddressesModel.fromJson(response.data);
    } catch (error) {
      printError("myAddressesRequest "+error.toString());
      return null;
    }
  }
}
