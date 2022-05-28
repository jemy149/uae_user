import 'package:dio/dio.dart';
import 'package:uae_user/data/models/user_models/get_brands/get_brands_model.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class GetBrandsRequest {
  Future getBrandsRequest({required int subCategoryId,}) async {
    try {
      Response response = await DioHelper.postData(
          url: EP_GET_BRANDS , data: {
        'subCategoryId': subCategoryId,
        'page': 0,

      });
      printResponse(response.data.toString());
      return GetBrandsModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
