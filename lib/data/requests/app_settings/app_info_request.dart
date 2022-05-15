import 'package:dio/dio.dart';
import 'package:uae_user/data/models/user_models/app_settings/app_info_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class AppInfoRequest {
  static Future appInfoRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_APP_INFO, data: {});
      printResponse(response.data.toString());
      return AppInfoModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}