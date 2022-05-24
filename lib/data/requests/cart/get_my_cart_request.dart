import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';
import 'package:uae_user/data/models/user_models/cart/get_my_cart_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class GetMyCartRequest {
   Future getMyCartRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_GET_MY_CART, data: {
        'apiToken': apiToken,
      });
      printResponse(response.data.toString());
      return GetMyCartModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
