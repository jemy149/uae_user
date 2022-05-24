import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/cart/clear_cart_model.dart';

class ClearCartRequest {
  static Future clearCartRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_CLEAR_CART, data: {
        'apiToken': apiToken,
      });
      printResponse(response.data.toString());
      return ClearCartModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
