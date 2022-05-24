part of 'add_favourite_cubit.dart';

@immutable
abstract class AddFavouriteState {}

class UserAddFavouriteInitialState extends AddFavouriteState {}
class UserAddFavouriteSuccessState extends AddFavouriteState {}
class UserAddFavouriteLoadingState extends AddFavouriteState {

}
class UserAddFavouriteErrorState extends AddFavouriteState {}

