import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/auth/resend_code_model.dart';

class ResendCodeRequest {
  static Future resendCodeRequest({
    required String phone,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_RESEND_CODE, data: {
        'phone': phone,
      });
      printResponse(response.data.toString());
      return ResendCodeModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
