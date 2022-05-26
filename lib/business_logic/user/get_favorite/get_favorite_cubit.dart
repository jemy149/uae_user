import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/requests/favorites/favorite_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/favorites/favorites_model.dart';
import '../../../data/requests/favorites/get_favorites_request.dart';

part 'get_favorite_state.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  GetFavoriteCubit() : super(GetFavoriteInitial());

  static GetFavoriteCubit get(context) => BlocProvider.of<GetFavoriteCubit>(context);

  FavoriteModel favoriteModel = FavoriteModel();

  void getFavorite(
  ) {
    emit(GetFavoriteLoadingState());
    GetFavoritesRequest().getFavoritesRequest().then((value) {
      favoriteModel = value;
      if (value.status == 200) {
        emit(GetFavoriteSuccessState());
      } else if (value.status == 204) {
        emit(GetFavoriteEmptyState());
      } else {
        emit(GetFavoriteErrorState());
      }
    }).catchError((error) {
      emit(GetFavoriteErrorState());
      printResponse('getFavorite' + error.toString());
    });
  }

  void removeItem(final productId){
     favoriteModel.products
          .removeWhere((element) => element.id==productId);
     if (favoriteModel.products.isNotEmpty) {
       emit(RemoveItemState());
     }
     else{
       emit(GetFavoriteEmptyState());
     }

  }

}
