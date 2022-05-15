import 'package:flutter/material.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/custome_stepper.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserOrdersItem extends StatelessWidget {
  final Function() onTap;

  const UserOrdersItem({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shadowColor: AppColors.black,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        DefaultText(
                          text: '${AppLocalizations.of(context)!.orderNo} # ${667997}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontFamily: 'Bukra-Regular',
                                  fontWeight: FontWeight.bold),
                        ),
                        DefaultText(
                            text: AppLocalizations.of(context)!.uaeStores,
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DefaultText(
                        text: 'waiting',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Bukra-Regular',
                            color: AppColors.green),
                      ),
                    )
                  ],
                ),
                const CustomeStepper(
                  isAccepted: false,
                  isFinished: false,
                  isProgressing: false,
                  isWaiting: true,
                  isWaitingForDelivery: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
