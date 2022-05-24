import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/favorites/favorite_model.dart';
import '../../../data/requests/favorites/favorite_request.dart';

part 'add_favourite_state.dart';

class AddFavouriteCubit extends Cubit<AddFavouriteState> {
  AddFavouriteCubit() : super(UserAddFavouriteInitialState());


  FavoriteModel favoriteModel = FavoriteModel();

  void userAddFavourite ({required int productId}){
    emit(UserAddFavouriteInitialState());
    FavoriteRequest()
        .favoriteRequest(productId: productId)
        .then((value) {
      if(value.status == 200){
        favoriteModel = value;
        emit(UserAddFavouriteSuccessState());
      }else {
        emit(UserAddFavouriteErrorState());
      }
    }).catchError((error){
      printResponse('userAddFavourite' + error.toString());
    });
  }
}
