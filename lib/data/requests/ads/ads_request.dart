import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/ads/ads_model.dart';

class AdsRequest {
  static Future adsRequest({
    required String type,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_ADS, data: {
        'apiToken': apiToken,
        'page': 0,
        'type': type,
      });
      printResponse(response.data.toString());
      return AdsModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
