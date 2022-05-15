import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/auth/login_model.dart';

class LoginRequest {
  static Future loginRequest({
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_LOGIN, data: {
        'type': 'user',
        'phone': phone,
        'password': password,
      });
      printResponse(response.data.toString());
      return LoginModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
