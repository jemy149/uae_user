import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/favorites/favorite_model.dart';

class FavoriteRequest {
   Future favoriteRequest({
  required int productId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_FAVORITE, data: {
        'page': 0,
        'apiToken': apiToken,
        'productId': productId,
      });
      printResponse(response.data.toString());
      return FavoriteModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
