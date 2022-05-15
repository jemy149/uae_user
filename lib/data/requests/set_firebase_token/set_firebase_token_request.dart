import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/set_firebase_token/set_firebase_token_model.dart';

class SetFirebaseTokenRequest {
  static Future setFirebaseTokenRequest({
    required String fireToken,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_SET_FIREBASE_TOKEN, data: {
        'apiToken': apiToken,
        'fireToken': fireToken,
      });
      printResponse(response.data.toString());
      return SetFirebaseTokenModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}