import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/notifications/notifications_model.dart';

class NotificationsRequest {
  static Future notificationsRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_NOTIFICATIONS, data: {
        'apiToken': apiToken,
        'page': 0,
      });
      printResponse(response.data.toString());
      return NotificationsModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
