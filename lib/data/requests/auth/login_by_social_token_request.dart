import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/auth/login_model.dart';

class LoginBySocialTokenRequest {
  Future loginBySocialTokenRequest({
    required String? name,
    required String phone,
    required String? image,
    required String? email,
    required String socialToken,
  }) async {
    try {
      final requestData = <String, dynamic>{};
      void addIfNotNull(String key, dynamic value) {
        if (value != null) {
          requestData[key] = value;
        }
      }

      addIfNotNull('name', name);
      addIfNotNull('type', 'user');
      addIfNotNull(
        'phone',
        phone,);
      addIfNotNull(
        'socialToken',
        socialToken,);
      Response response = await DioHelper.postData(
          url: EP_LOGIN_BY_SOCIAL_TOKEN, data: requestData);
      printResponse(response.data.toString());
      return LoginModel.fromJson(response.data);
    } catch (error) {
      printError('loginBySocialTokenRequest ' + error.toString());
      return null;
    }
  }
}
