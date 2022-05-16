import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/app_settings/app_info_model.dart';
import 'package:uae_user/data/requests/app_settings/app_info_request.dart';

import '../../../constants/constant_methods.dart';


part 'all_app_setting_state.dart';

class AllAppSettingCubit extends Cubit<AllAppSettingStates> {
  AllAppSettingCubit() : super(AllAppSettingInitial());

  static AllAppSettingCubit get(context) => BlocProvider.of(context);

  AppInfoModel? terms;

  void getTerms() {
    emit(GetTermsLoadingState());
    AppInfoRequest.appInfoRequest().then((value) {
      terms = value;
      if (terms!.status.toString() == '200') {
        emit(GetTermsSuccessState());
      } else {

        emit(GetTermsErrorState());
      }
    }).catchError((error) {
      printResponse('getTerms' + error.toString());
    });
  }
  //
  // AppInfoModel? aboutUs;
  //
  // void getAboutUs() {
  //   emit(GetAboutUsLoadingState());
  //   AboutUsRequest.getAboutUsRequest().then((value) {
  //     aboutUs!.appInfo = value;
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
