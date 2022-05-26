part of 'favorite_change_cubit.dart';

@immutable
abstract class ChangeFavoriteStates {}

class FavoriteChangeInitial extends ChangeFavoriteStates {}

class FavoriteChangeSuccessState extends ChangeFavoriteStates {
  final int productId;

  FavoriteChangeSuccessState( {required this.productId});

}

class FavoriteChangeErrorState extends ChangeFavoriteStates {
  final String? msg;
 FavoriteChangeErrorState({ this.msg});
}
