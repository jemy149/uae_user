part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class UserCartInitialStates extends CartState {}
class UserCartSuccessStates extends CartState {}
class UserCartLoadingStates extends CartState {}
class UserCartErrorStates extends CartState {}
