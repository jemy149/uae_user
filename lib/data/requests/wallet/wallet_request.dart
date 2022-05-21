import 'package:dio/dio.dart';
import 'package:uae_user/data/models/user_models/wallet/wallet_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/constants.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';

class WalletRequest {
  Future walletRequest() async {
    try {
      Response response = await DioHelper.postData(
          url: EP_GET_MY_WALLET, data: {
        'apiToken': apiToken,
      });
      printResponse(response.data.toString());
      return WalletModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
