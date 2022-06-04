part of 'add_to_cart_cubit.dart';

@immutable
abstract class AddToCartState {}

class UserCartInitialStates extends AddToCartState {}

class UserAddCartSuccessStates extends AddToCartState {
  final String message;
  UserAddCartSuccessStates({ required this.message});
}
class UserAddCartNotAvailableStates extends AddToCartState {}
class UserAddCartLoadingStates extends AddToCartState {}
class UserAddCartErrorStates extends AddToCartState {}



