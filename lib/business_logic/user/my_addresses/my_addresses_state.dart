part of 'my_addresses_cubit.dart';

@immutable
abstract class MyAddressesState {}

class MyAddressesInitial extends MyAddressesState {}

class UserGetMyAddressesLoadingState extends MyAddressesState {}

class UserGetMyAddressesSuccessState extends MyAddressesState {}
class UserGetMyAddressesEmptyState extends MyAddressesState {}

class UserGetMyAddressesErrorState extends MyAddressesState {}



class UserDeleteAddressLoadingState extends MyAddressesState {}
class UserDeleteAddressSuccessState extends MyAddressesState {}
class UserDeleteAddressErrorState extends MyAddressesState {}
