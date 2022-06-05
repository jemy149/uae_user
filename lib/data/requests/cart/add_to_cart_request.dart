import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';
import 'package:uae_user/data/models/user_models/cart/add_to_cart_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class AddToCartRequest {
  Future addToCartRequest({
    required int productId,
    required int quantity,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_ADD_TO_CART, data: {
        'apiToken': apiToken,
        'productId': productId,
        'quantity': quantity,
      });
      printResponse(response.data.toString());
      return AddToCartModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
