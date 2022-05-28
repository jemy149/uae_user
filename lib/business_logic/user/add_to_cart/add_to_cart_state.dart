part of 'add_to_cart_cubit.dart';

@immutable
abstract class AddToCartState {}

class UserCartInitialStates extends AddToCartState {}

class UserAddCartSuccessStates extends AddToCartState {}
class UserAddCartNotAvailableStates extends AddToCartState {}
class UserAddCartLoadingStates extends AddToCartState {}
class UserAddCartErrorStates extends AddToCartState {}



