import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/wallet/wallet_model.dart';
import 'package:uae_user/data/requests/wallet/wallet_request.dart';
import '../../../constants/constant_methods.dart';
part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletStates> {
  WalletCubit() : super(UserWalletInitial());



   WalletModel walletModel = WalletModel();

  void userWallet (){
    emit(UserWalletLoadingState());
    WalletRequest()
        .walletRequest()
        .then((value) {
      printTest(walletModel.wallet.balance.toString());
      if(value.status == 200){
        walletModel = value;
        emit(UserWalletSuccessState(walletInfo: walletModel.wallet));
      }else {
        emit(UserWalletErrorState());
      }
    }).catchError((error){
      printResponse('userWallet' + error.toString());
    });
  }

}
