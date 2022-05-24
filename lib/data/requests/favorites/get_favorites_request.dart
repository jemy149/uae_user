import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/favorites/favorites_model.dart';

class GetFavoritesRequest {
   Future getFavoritesRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_GET_FAVORITES, data: {
        'page': 0,
        'apiToken': apiToken,
      });
      printResponse(response.data.toString());
      return FavoriteModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
