import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';
import 'package:uae_user/data/models/user_models/get_offers/get_offers_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class GetOffersRequest {
  static Future getOffersRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_GET_OFFERS , data: {
        'apiToken': apiToken,

      });
      printResponse(response.data.toString());
      return GetOffersModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
