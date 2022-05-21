part of 'wallet_cubit.dart';

@immutable
abstract class WalletStates {}

class UserWalletInitial extends WalletStates {}
class UserWalletLoadingState extends WalletStates {}
class UserWalletSuccessState extends WalletStates {
  final Wallet walletInfo;
  UserWalletSuccessState({required this.walletInfo});
}
class UserWalletErrorState extends WalletStates {}
