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

  AdsModel adsModel = AdsModel();

  void userAds({
    required String type,
  }){
    emit(UserAdsLoadingState());
     AdsRequest()
         .adsRequest(type: type,page: 0)
         .then((value) {
       adsModel = value;
      if(value.status == 200){
        adsModel = value;
        emit(UserAdsSuccessState(ads:adsModel.ads));
      }else if(value.status == 204){
        adsModel = value;
        emit(UserNoAdsState());
      }
    }).catchError((error){
      emit(UserAdsErrorState());
      printResponse('userAds' + error.toString());
    });
  }

  void userAdsMore({
    required String type,
  }){
    emit(UserAdsLoadingState());
     AdsRequest().adsRequest(type: type,page: 0).then((value) {
       adsModel = value;
      if(value.status == 200){
        adsModel = value;
        emit(UserAdsSuccessState(ads:adsModel.ads));
      }else if(value.status == 204){
        adsModel = value;
       emit(UserNoAdsState());
      }
    }).catchError((error){
      emit(UserAdsErrorState());
      printResponse('userAds' + error.toString());
    });
  }


}
