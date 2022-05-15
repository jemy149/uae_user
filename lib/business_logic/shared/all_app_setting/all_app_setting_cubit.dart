import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


part 'all_app_setting_state.dart';

class AllAppSettingCubit extends Cubit<AllAppSettingStates> {
  AllAppSettingCubit() : super(AllAppSettingInitial());

  static AllAppSettingCubit get(context) => BlocProvider.of(context);

  // TermsModel? terms;
  //
  // void getTerms() {
  //   emit(GetTermsLoadingState());
  //   TermsRequest.getTermsRequest().then((value) {
  //     terms = value;
  //     if (terms!.status.toString() == '200') {
  //       emit(GetTermsSuccessState());
  //     } else {
  //
  //       emit(GetTermsErrorState());
  //     }
  //   }).catchError((error) {
  //     printResponse('getTerms' + error.toString());
  //   });
  // }
  //
  // AboutUsModel? aboutUs;
  //
  // void getAboutUs() {
  //   emit(GetAboutUsLoadingState());
  //   AboutUsRequest.getAboutUsRequest().then((value) {
  //     aboutUs = value;
  //     if (aboutUs!.status.toString() == '200') {
  //       emit(GetAboutUsSuccessState());
  //     } else {
  //       emit(GetAboutUsErrorState());
  //     }
  //   }).catchError((error) {
  //     printResponse('getAboutUs' + error.toString());
  //   });
  // }
}
