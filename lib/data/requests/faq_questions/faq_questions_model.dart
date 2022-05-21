import 'package:dio/dio.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/faq_questions/faq_questions_model.dart';

class FaqQuestionsRequest {
   Future faqQuestionsRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_FAQ_QUESTIONS, data: {
        'page': 0,
      });
      printResponse(response.data.toString());
      return FaqQuestionsModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
