import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';
import 'package:uae_user/data/requests/make_order/make_order_request/order_location_model.dart';
import '../../../models/user_models/make_order/make_order_model.dart';
import 'cart_item_model/cart_item_model.dart';

class MakeOrderRequest {
  static Future makeOrderRequest({
     MakeOrderLocation? makeOrderLocation ,
    String? discountCode,
    String? extraDescription,
    String? paymentMethod,
    String? deliveryTime,
    String? paymentId,
  }) async {
    try {
      final requestData = <String, dynamic>{};
      void addIfNotNull(String key, dynamic value) {
        if (value != null) {
          requestData[key] = value;
        }
      }
      addIfNotNull('apiToken', apiToken);
      addIfNotNull('orderLocation', makeOrderLocation!.toJson());
      addIfNotNull('discountCode', discountCode);
      addIfNotNull('extraDescription', extraDescription);
      addIfNotNull('paymentMethod', paymentMethod);
      addIfNotNull('deliveryTime', deliveryTime);
      addIfNotNull('paymentId', paymentId);
      Response response = await DioHelper.postData(
          url: EP_MAKE_ORDER,
          data: requestData
      );
      printResponse(response.data.toString());
      return MakeOrderModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
