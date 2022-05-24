
import 'package:dio/dio.dart';
import 'package:uae_user/data/models/user_models/get_products/get_products_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class GetProductRequest {
   Future getProductRequest({required int productId}) async {
    try {
      Response response = await DioHelper.postData(url: EP_GET_PRODUCTS , data: {
        'productId': productId,
      });
      printResponse(response.data.toString());
      return GetProductsModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}