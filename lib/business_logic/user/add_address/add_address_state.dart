part of 'add_address_cubit.dart';

@immutable
abstract class AddAddressState {}

class AddAddressInitial extends AddAddressState {}
class UserAddAddressLoadingState extends AddAddressState {}
class UserAddAddressSuccessState extends AddAddressState {}
class UserAddAddressErrorState extends AddAddressState {}
