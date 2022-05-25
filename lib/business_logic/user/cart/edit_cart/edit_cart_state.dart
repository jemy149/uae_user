part of 'edit_cart_cubit.dart';

@immutable
abstract class EditCartState {}

class EditCartInitial extends EditCartState {}
class UserEditCartSuccessState extends EditCartState {
String? msg;
UserEditCartSuccessState({ this.msg});
}
class UserEditCartLoadingState extends EditCartState {}

class UserEditCartErrorState extends EditCartState {}
