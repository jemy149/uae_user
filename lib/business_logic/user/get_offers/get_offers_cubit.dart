import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/get_offers/get_offers_model.dart';
import 'package:uae_user/data/requests/get_offers/get_offers_request.dart';

import '../../../constants/constant_methods.dart';

part 'get_offers_state.dart';

class GetOffersCubit extends Cubit<GetOffersState> {
  GetOffersCubit() : super(UserGetOffersInitial());


  static GetOffersCubit get(context) => BlocProvider.of(context);

  GetOffersModel getOffersModel =GetOffersModel();

  void userGetOffers (){
    emit(UserGetOffersLoadingState());
    GetOffersRequest.getOffersRequest()
        .then((value) {
      printTest(getOffersModel.toString());
      if(value.status == 200){
        getOffersModel = value;
        emit(UserGetOffersSuccessState(offers: getOffersModel.offers));
      }else if(value.status == 204){
        emit(UserGetOffersEmptyState());
      }
    }).catchError((error){
      emit(UserGetOffersErrorState());
      printResponse('userGetOffers' + error.toString());
    });
  }

}
