import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/wallet/wallet_cubit.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/views/wallet_card_item.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key}) : super(key: key);
  late WalletCubit _walletCubit;
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => WalletCubit()..userWallet(),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Flexible(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Image.asset(
                        'assets/images/whiteLogo.png',
                        height: 80,
                        width: 80,
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 19,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                width: double.maxFinite,
                child: BlocBuilder<WalletCubit, WalletStates>(
                  builder: (context, state) {
                    if (state is UserWalletSuccessState ) {
                      return   Column(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 30.0, bottom: 40.0),
                            child: DefaultText(
                              text: AppLocalizations.of(context)!.wallet,
                              style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                fontFamily: 'Bukra-Regular',
                              ),
                            ),
                          ),
                          WalletCardItem(
                              text: AppLocalizations.of(context)!.pointsDue,
                              points: state.walletInfo.points.toString(),
                              countText:
                              '${AppLocalizations.of(context)!.point}'),
                          WalletCardItem(
                            text: AppLocalizations.of(context)!.cashBack,
                            points:state.walletInfo.cashback.toString(),),
                          WalletCardItem(
                            text: AppLocalizations.of(context)!.walletBalance,
                            points: state.walletInfo.balance.toString(),),
                        ],
                      );
                    } else if (state is UserWalletLoadingState) {
                      return  const DefaultLoadingIndicator();
                    } else {
                      return const DefaultErrorWidget();
                    }

                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
