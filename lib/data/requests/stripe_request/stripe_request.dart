//
//
//
//
// import 'package:get/get_connect/http/src/response/response.dart';
//
// import '../../../constants/constant_methods.dart';
// import '../../data_provider/remote/dio_helper.dart';
//
// class WalletRequest {
//   Future walletRequest(String amount, String currency) async {
//     try {
//       Response response = await DioHelper.postData(
//           url: EP_GET_MY_WALLET, data: {
//         'apiToken': apiToken,
//       });
//       printResponse(response.data.toString());
//       return WalletModel.fromJson(response.data);
//     } catch (error) {
//       printError(error.toString());
//       return null;
//     }
//   }
// }
//
// createPaymentIntent(String amount, String currency) async {
//   try {
//     Map<String, dynamic> body = {
//       'amount': calculateAmount(amount),
//       'currency': currency,
//       'payment_method_types[]': 'card'
//     };
//
//     var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         body: body,
//         headers: {
//           'Authorization': 'Bearer Your Stripe Secret Key',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         });
//     return jsonDecode(response.body);
//   } catch (err) {
//     print('err charging user: ${err.toString()}');
//   }
// }