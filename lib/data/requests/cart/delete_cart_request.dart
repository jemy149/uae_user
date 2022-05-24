import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/cart/delete_cart_model.dart';

class DeleteCartRequest {
  static Future deleteCartRequest({
    required int cartId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_DELETE_CART, data: {
        'apiToken': apiToken,
        'cartId': cartId,
      });
      printResponse(response.data.toString());
      return DeleteCartModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
