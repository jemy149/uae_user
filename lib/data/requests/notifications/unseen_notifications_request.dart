import 'package:dio/dio.dart';
import 'package:uae_user/constants/constants.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/notifications/unseen_notifications_model.dart';

class UnSeenNotificationsRequest {
  static Future unSeenNotificationsRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_UNSEEN_NOTIFICATIONS, data: {
        'apiToken': apiToken,
      });
      printResponse(response.data.toString());
      return UnSeenNotificationsModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
