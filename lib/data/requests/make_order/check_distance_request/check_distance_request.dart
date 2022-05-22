import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';
import 'package:uae_user/data/requests/make_order/check_distance_request/order_location_model.dart';
import '../../../models/user_models/make_order/check_distance_model.dart';

class CheckDistanceRequest {
  static Future checkDistanceRequest({
    required Location orderLocation,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_CHECK_DISTANCE, data: {
        'page': 0,
        'apiToken': apiToken,
        'orderLocation': orderLocation.toJson(),
      });
      printResponse(response.data.toString());
      return CheckDistanceModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
