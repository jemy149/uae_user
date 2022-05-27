import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';
import '../../../models/user_models/make_order/check_distance_model.dart';
import '../make_order_request/order_location_model.dart';

class CheckDistanceRequest {
   Future checkDistanceRequest({
    required MakeOrderLocation orderLocation,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_CHECK_DISTANCE, data: {
        'apiToken': apiToken,
        'orderLocation': orderLocation.toJson(),
      });
      printResponse(response.data.toString());
      return CheckDistanceModel.fromJson(response.data);
    } catch (error) {
      printError('checkDistanceRequest '+error.toString());
      return null;
    }
  }
}
