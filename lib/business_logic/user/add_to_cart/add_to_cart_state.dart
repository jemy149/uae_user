part of 'add_to_cart_cubit.dart';

@immutable
abstract class CartState {}

class UserCartInitialStates extends CartState {}

class UserAddCartSuccessStates extends CartState {}
class UserAddCartLoadingStates extends CartState {}
class UserAddCartErrorStates extends CartState {}



