import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../../constants/constants.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/auth/login_model.dart';

class LoginBySocialTokenRequest {
  static Future loginBySocialTokenRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_LOGIN_BY_SOCIAL_TOKEN, data: {
        'type': 'user',
        'socialToken': socialToken,
      });
      printResponse(response.data.toString());
      return LoginModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
