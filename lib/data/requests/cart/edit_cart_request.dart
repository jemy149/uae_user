import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/cart/edit_cart_model.dart';

class EditCartRequest {
  static Future editCartRequest({
    required int cartId,
    required int quantity,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_EDIT_CART, data: {
        'apiToken': apiToken,
        'cartId': cartId,
        'quantity': quantity,
      });
      printResponse(response.data.toString());
      return EditCartModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
