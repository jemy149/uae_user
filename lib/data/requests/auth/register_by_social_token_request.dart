
import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/auth/register_model.dart';

class RegisterBySocialTokenRequest {
   Future registerBySocialTokenRequest({
  required String? name,
  required String phone,
  required String image,
  required String? email,
  required String socialToken,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_REGISTER_BY_SOCIAL_TOKEN, data: {
        if(name!=null)'name': name,
        'type': 'user',
        'phone': phone,
        'socialToken': socialToken,
        if(email!=null)'email':email,
        'image':image,
      });
      printResponse(response.data.toString());
      return RegisterModel.fromJson(response.data);
    } catch (error) {
      printError('registerBySocialTokenRequest '+error.toString());
      return null;
    }
  }
}
