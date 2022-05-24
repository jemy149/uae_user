import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/favorites/change_favorite_model.dart';
import 'package:uae_user/data/requests/favorites/favorite_request.dart';

import '../../../constants/constant_methods.dart';

part 'favorite_change_state.dart';

class ChangeFavoriteCubit extends Cubit<ChangeFavoriteStates> {
  ChangeFavoriteCubit() : super(FavoriteChangeInitial());

  static ChangeFavoriteCubit get(context) =>
      BlocProvider.of<ChangeFavoriteCubit>(context);

  ChangeFavoriteModel changeFavoriteModel = ChangeFavoriteModel();

  void changeFavorite({
    required int productId,
    required int index
  }) {
    ChangeFavoriteRequest()
        .changeFavoriteRequest(productId: productId)
        .then((value) {
      changeFavoriteModel = value;
      if (value.status == 200) {
        emit(FavoriteChangeSuccessState(index:index));
      } else {
        emit(FavoriteChangeErrorState(msg: changeFavoriteModel.message));
      }
    }).catchError((error) {
      emit(FavoriteChangeErrorState());
      printResponse('changeFavorite ' + error.toString());
    });
  }
}
