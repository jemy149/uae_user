part of 'faq_questions_cubit.dart';

@immutable
abstract class FaqQuestionsState {}

class UserFaqQuestionsInitial extends FaqQuestionsState {}
class UserFaqQuestionsLoadingState extends FaqQuestionsState {}
class UserFaqQuestionsSuccessState extends FaqQuestionsState {
  final List<Faqs> faqs;
  UserFaqQuestionsSuccessState({required this.faqs});
}
class UserFaqQuestionsErrorState extends FaqQuestionsState {}
