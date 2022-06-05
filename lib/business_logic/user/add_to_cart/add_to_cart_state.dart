part of 'add_to_cart_cubit.dart';

@immutable
abstract class AddToCartState {}

class UserAddToCartInitialStates extends AddToCartState {}

class UserAddToCartSuccessStates extends AddToCartState {
  final String message;
  UserAddToCartSuccessStates({ required this.message});
}
class UserAddToCartNotAvailableStates extends AddToCartState {}
class UserAddToCartLoadingStates extends AddToCartState {}
class UserAddToCartErrorStates extends AddToCartState {}



