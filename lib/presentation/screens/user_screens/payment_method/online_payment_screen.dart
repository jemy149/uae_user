import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import '../../../styles/colors.dart';

class OnlinePaymentMethodScreen extends StatefulWidget {
  const OnlinePaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<OnlinePaymentMethodScreen> createState() =>
      _OnlinePaymentMethodScreenState();
}

class _OnlinePaymentMethodScreenState extends State<OnlinePaymentMethodScreen> {
  ChoosePaymentMethodScreenRadioValues? _character =
      ChoosePaymentMethodScreenRadioValues.Cash;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 15,
                    ),
                    child: DefaultText(
                      text: AppLocalizations.of(context)!.choosePaymentMethod,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Bukra-Regular',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 50,
                    ),
                    child: DefaultText(
                      text: AppLocalizations.of(context)!.paymentAmount,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Bukra-Regular',
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultText(
                      text: ' >>> ',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          color: AppColors.lightBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: AppColors.lightBlue,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: DefaultText(
                          text: '${05345345400}',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              color: AppColors.lightBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        ),
                      ),
                    ),
                    DefaultText(
                      text: ' <<< ',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          color: AppColors.lightBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 50,
                    ),
                    child: DefaultText(
                      text: AppLocalizations.of(context)!.selectPaymentMethod,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Bukra-Regular',
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: DefaultText(
                  text: AppLocalizations.of(context)!.cash,
                ),
                leading: Radio<ChoosePaymentMethodScreenRadioValues>(
                  value: ChoosePaymentMethodScreenRadioValues.Cash,
                  groupValue: _character,
                  onChanged: (ChoosePaymentMethodScreenRadioValues? value) {
                    setState(() {
                      _character = value;
                      // paymentMethod = 'Cash';
                    });
                  },
                ),
              ),
              ListTile(
                title: DefaultText(
                  text: AppLocalizations.of(context)!.onlinePayment,
                ),
                leading: Radio<ChoosePaymentMethodScreenRadioValues>(
                  value: ChoosePaymentMethodScreenRadioValues.onlinePayment,
                  groupValue: _character,
                  onChanged: (ChoosePaymentMethodScreenRadioValues? value) {
                    setState(() {
                      _character = value;
                      // paymentMethod = 'Visa';
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 50),
                child: DefaultMaterialButton(
                  text: AppLocalizations.of(context)!.pay,
                  onTap: () {},
                  height: 50,
                  width: 120,
                  textColor: Colors.white,
                  color: AppColors.lightBlue,
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

}


enum ChoosePaymentMethodScreenRadioValues { Cash, onlinePayment }


