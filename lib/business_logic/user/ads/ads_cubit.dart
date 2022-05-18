import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/requests/ads/ads_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/constants.dart';
import '../../../data/models/user_models/ads/ads_model.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsStates> {
  AdsCubit() : super(UserAdsInitial());
   static AdsCubit get(context) => BlocProvider.of(context);

  AdsModel? adsModel = AdsModel();

  void userAds({
    required String type,
  })async{
    emit(UserAdsLoadingState());
     AdsRequest.adsRequest(type: type).then((value) => (value) async{
        adsModel =await value;
      if(adsModel!.status == 200){
        emit(UserAdsSuccessState());
      }else{
        emit(UserAdsErrorState());
      }
    }).catchError((error){
      printResponse('userAds' + error.toString());
    });
  }


}
