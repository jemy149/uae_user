import 'package:dio/dio.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/categories/sub_category_model.dart';

class SubCategoryRequest {
  static Future subCategoryRequest({
    required int page,
    required int categoryId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_GET_CATEGORIES, data: {
        'page': page,
        'categoryId': categoryId,
      });
      printResponse(response.data.toString());
      return SubCategoryModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
