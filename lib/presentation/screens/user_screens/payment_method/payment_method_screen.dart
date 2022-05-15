import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/screens/user_screens/app_layout/home_layout.dart';
import 'package:uae_user/presentation/views/payment_method_item.dart';

import '../../../../constants/enums.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentMethodScreenRadioValues? _character =
      PaymentMethodScreenRadioValues.cash;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightBlue,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.lightBlue,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.only(end: 60),
                  child: DefaultText(
                    text: AppLocalizations.of(context)!.paymentMethod,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: 'Bukra-Regular',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  )),
            ],
          ),
        ),
        body: Column(
          children: [
            Flexible(
                flex: 10,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  end: 10.0, top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    child: Image.asset(
                                      'assets/images/edit.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                    onTap: () {},
                                  )
                                ],
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  PaymentMethodItem(),
                              itemCount: 2,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DefaultText(
                                    text: AppLocalizations.of(context)!
                                        .choosePaymentMethod,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                          fontFamily: 'Bukra-Regular',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            /////////////////////////// Radio buttons part /////////////////////////
                            ListTile(
                              title: DefaultText(
                                text: AppLocalizations.of(context)!.cash,
                              ),
                              leading: Radio<PaymentMethodScreenRadioValues>(
                                value: PaymentMethodScreenRadioValues.cash,
                                groupValue: _character,
                                onChanged: (PaymentMethodScreenRadioValues? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                  
                                },
                              ),
                            ),
                            ListTile(
                              title: DefaultText(
                                text: AppLocalizations.of(context)!.onlinePayment,
                              ),
                              leading: Radio<PaymentMethodScreenRadioValues>(
                                value: PaymentMethodScreenRadioValues.onlinePayment,
                                groupValue: _character,
                                onChanged: (PaymentMethodScreenRadioValues? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            /////////////////////////// location and delivery time part /////////////////////////
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        DefaultText(
                                          text: AppLocalizations.of(context)!.location,
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                        DefaultText(
                                          text:
                                          'delivery location delivery location delivery location delivery location delivery location ',
                                          maxLines: 4,
                                          style: Theme.of(context).textTheme.caption,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(start: 10,bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        DefaultText(
                                          text: AppLocalizations.of(context)!.deliveryTime,
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                        DefaultText(
                                          text:
                                          '2022-04-28',
                                          maxLines: 4,
                                          style: Theme.of(context).textTheme.caption,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /////////////////////////// additional details for ordering part /////////////////////////
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DefaultText(
                                  text: AppLocalizations.of(context)!.additionalDetailsForOrdering,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 20.0, bottom: 10.0,top: 10.0),
                                  child: DefaultText(
                                    text: AppLocalizations.of(context)!.orderCost,
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 20.0, bottom: 10.0,top: 10.0),
                                  child: DefaultText(
                                    text: '${10.00} AED',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 20.0, bottom: 10.0),
                                  child: DefaultText(
                                    text: AppLocalizations.of(context)!.deliveryFees,
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 20.0, bottom: 10.0),
                                  child: DefaultText(
                                    text: '${10.00} AED',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 20.0, bottom: 10.0),
                                  child: DefaultText(
                                    text: AppLocalizations.of(context)!.total,
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 20.0, bottom: 10.0),
                                  child: DefaultText(
                                    text: '${10.00} AED',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )),
            Flexible(
                flex: 2,
                child: Container(
                  color: AppColors.lightBlue,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>const HomeLayout(),
                          ),
                              (route) {
                            return false;
                          },
                        );

                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: DefaultText(
                                text:
                                    (AppLocalizations.of(context)!.finishOrder),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      fontFamily: 'Bukra-Regular',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.only(end: 1.0),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.lightBlue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

