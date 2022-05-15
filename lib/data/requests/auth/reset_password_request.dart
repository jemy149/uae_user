import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/auth/forget_password_model.dart';

class ResetPasswordRequest {
  static Future resetPasswordRequest({
    required String newPassword,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_FORGET_PASSWORD, data: {
        'newPassword': newPassword,
        'tmpToken': tmpToken,
      });
      printResponse(response.data.toString());
      return ForgetPasswordModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
