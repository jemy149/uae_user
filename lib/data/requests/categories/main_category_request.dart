import 'package:dio/dio.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/categories/main_category_model.dart';

class MainCategoryRequest {
   Future mainCategoryRequest({
    required int page,
  }) async {
    try {
      Response response = await DioHelper.postData(
          url: EP_GET_CATEGORIES,
          data: {
        'page': page,
        'type': 'mainCategory',
      });
      printResponse(response.data.toString());
      return MainCategoryModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
