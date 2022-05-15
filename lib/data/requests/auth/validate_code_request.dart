import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/auth/validate_code_model.dart';

class ValidateCodeRequest {
  static Future validateCodeRequest({
  String? phone,
  String? tmpToken,
  required String code,
  }) async {
    final requestData = <String, dynamic>{};
    void addIfNotNull(String key, dynamic value) {
      if (value != null) {
        requestData[key] = value;
      }
    }
    addIfNotNull('phone', phone);
    addIfNotNull('tmpToken', tmpToken);
    addIfNotNull('code', code);
    try {
      Response response = await DioHelper.postData(url: EP_VALIDATE_CODE, data: requestData);
      printResponse(response.data.toString());
      return ValidateCodeModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
