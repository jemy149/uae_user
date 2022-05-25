part of 'delete_cart_cubit.dart';

@immutable
abstract class DeleteCartState {}

class DeleteCartInitial extends DeleteCartState {}
class UserDeleteCartSuccessState extends DeleteCartState {

}

class UserDeleteCartErrorState extends DeleteCartState {}

