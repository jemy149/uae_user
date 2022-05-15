import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/get_orders/get_orders_model.dart';

class GetOrdersRequest {
  static Future getOrdersRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_GET_ORDERS, data: {
        'page': 0,
        'apiToken': apiToken,
      });
      printResponse(response.data.toString());
      return GetOrdersModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}