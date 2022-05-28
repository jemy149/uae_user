part of 'get_offers_cubit.dart';

@immutable
abstract class GetOffersState {}


class UserGetOffersInitial extends GetOffersState {}
class UserGetOffersLoadingState extends GetOffersState {}
class UserGetOffersSuccessState extends GetOffersState {
  List<Offers> offers;
  UserGetOffersSuccessState({required this.offers});
}
class UserGetOffersEmptyState extends GetOffersState {}
class UserGetOffersErrorState extends GetOffersState {}

