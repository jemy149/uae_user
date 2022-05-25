part of 'get_my_cart_cubit.dart';

@immutable
abstract class GetMyCartState {}

class GetMyCartInitial extends GetMyCartState {}
class UserGetCartSuccessState extends GetMyCartState {
  List<Carts> carts;
  UserGetCartSuccessState({required this.carts});
}
class UserGetCartLoadingState extends GetMyCartState {}
class UserGetCartEmptyState extends GetMyCartState {}
class UserGetCartErrorState extends GetMyCartState {}
