part of 'my_addresses_cubit.dart';

@immutable
abstract class MyAddressesState {}

class MyAddressesInitial extends MyAddressesState {}

class UserGetMyAddressesLoadingState extends MyAddressesState {}

class UserGetMyAddressesSuccessState extends MyAddressesState {}
class UserGetMyAddressesEmptyState extends MyAddressesState {}

class UserGetMyAddressesErrorState extends MyAddressesState {}



class UserDeleteAddressLoadingState extends MyAddressesState {}
class UserDeleteAddressSuccessState extends MyAddressesState {
  final String message;

  UserDeleteAddressSuccessState(this.message);

}
class UserDeleteAddressErrorState extends MyAddressesState {
  final String message;

  UserDeleteAddressErrorState(this.message);

}

class UserEditAddressSuccessState extends MyAddressesState {
  final String message;

  UserEditAddressSuccessState(this.message);
}
class UserEditAddAddressErrorState extends MyAddressesState {
  final String message;

  UserEditAddAddressErrorState(this.message);

}


class UserChooseLocationState extends MyAddressesState {
  final ApiAddress apiAddress;

  UserChooseLocationState( this.apiAddress);

}
