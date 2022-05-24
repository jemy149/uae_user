part of 'get_my_cart_cubit.dart';

@immutable
abstract class GetMyCartState {}

class GetMyCartInitial extends GetMyCartState {}
class UserGetCartSuccessState extends GetMyCartState {
  List<Carts> cart;
  UserGetCartSuccessState({required this.cart});
}
class UserGetCartLoadingState extends GetMyCartState {}
class UserGetCartEmptyState extends GetMyCartState {}
class UserGetCartErrorState extends GetMyCartState {}
