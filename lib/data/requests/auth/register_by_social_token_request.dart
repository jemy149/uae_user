import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/auth/register_model.dart';

class RegisterBySocialTokenRequest {
  static Future registerBySocialTokenRequest({
  required String name,
  required String phone,
  required String email,
  required String socialToken,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_REGISTER_BY_SOCIAL_TOKEN, data: {
        'name': name,
        'type': 'user',
        'phone': phone,
        'socialToken': socialToken,
      });
      printResponse(response.data.toString());
      return RegisterModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
