part of 'ads_cubit.dart';

@immutable
abstract class AdsStates {}

class UserAdsInitial extends AdsStates {}
class UserAdsLoadingState extends AdsStates {}
class UserAdsSuccessState extends AdsStates {}
class UserNoAdsState extends AdsStates {}
class UserAdsErrorState extends AdsStates {}
