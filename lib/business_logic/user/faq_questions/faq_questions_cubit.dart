import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/faq_questions/faq_questions_model.dart';
import 'package:uae_user/data/requests/faq_questions/faq_questions_model.dart';
import '../../../constants/constant_methods.dart';
part 'faq_questions_state.dart';

class FaqQuestionsCubit extends Cubit<FaqQuestionsState> {
  FaqQuestionsCubit() : super(UserFaqQuestionsInitial());


  FaqQuestionsModel faqQuestions = FaqQuestionsModel();
  void userFaqQuestions (){
    emit(UserFaqQuestionsLoadingState());
    FaqQuestionsRequest()
        .faqQuestionsRequest()
        .then((value) {
      if(value.status == 200){
        faqQuestions = value;
        emit(UserFaqQuestionsSuccessState(faqs: faqQuestions.faqs));
      }else {
        emit(UserFaqQuestionsErrorState());
      }
    }).catchError((error){
      printResponse('userFaqQuestions' + error.toString());
    });
  }
}
