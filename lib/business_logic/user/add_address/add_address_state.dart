part of 'add_address_cubit.dart';

@immutable
abstract class AddAddressState {}

class AddAddressInitial extends AddAddressState {}
class UserAddAddressLoadingState extends AddAddressState {}
class UserAddAddressSuccessState extends AddAddressState {
  final String message;

  UserAddAddressSuccessState(this.message);
}
class UserAddAddressErrorState extends AddAddressState {
  final String message;

  UserAddAddressErrorState(this.message);

}
