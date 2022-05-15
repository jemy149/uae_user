import 'package:dio/dio.dart';
import 'package:uae_user/data/data_provider/remote/dio_helper.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/constants.dart';
import '../../../constants/end_points.dart';
import '../../models/user_models/logout/logout_model.dart';

class LogoutRequest {
  static Future logoutRequest() async {
    try {
      Response response =
          await DioHelper.postData(url: EP_USER_LOGOUT, token: accessToken);
      printResponse(response.data.toString());
      return LogoutModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
