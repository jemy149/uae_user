import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:uae_user/business_logic/user/make_order/make_order_cubit.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/presentation/screens/user_screens/app_layout/home_layout.dart';
import 'package:uae_user/presentation/views/payment_method_item.dart';
import '../../../../constants/enums.dart';
import '../../../../data/requests/make_order/make_order_request/order_location_model.dart';
import '../../../router/arguments/user_arguments/payment_method_screen_args.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class PaymentMethodScreen extends StatefulWidget {
  final PaymentMethodScreenArgs paymentMethodScreenArgs;

  const PaymentMethodScreen({Key? key, required this.paymentMethodScreenArgs})
      : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {

  PaymentMethodScreenRadioValues? _character =
      PaymentMethodScreenRadioValues.Cash;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  late MakeOrderCubit _makeOrderCubit;
  String paymentMethod = 'Cash';

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => MakeOrderCubit(),
      child: SafeArea(
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
                                padding:
                                    const EdgeInsetsDirectional.only(top: 8.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      PaymentMethodItem(
                                          index: index,
                                          getMyCartModel: widget
                                              .paymentMethodScreenArgs
                                              .getMyCartModel),
                                  itemCount: widget.paymentMethodScreenArgs
                                      .getMyCartModel.carts.length,
                                ),
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
                                  value: PaymentMethodScreenRadioValues.Cash,
                                  groupValue: _character,
                                  onChanged:
                                      (PaymentMethodScreenRadioValues? value) {
                                    setState(() {
                                      _character = value;
                                      paymentMethod = 'Cash';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: DefaultText(
                                  text: AppLocalizations.of(context)!
                                      .onlinePayment,
                                ),
                                leading: Radio<PaymentMethodScreenRadioValues>(
                                  value: PaymentMethodScreenRadioValues
                                      .onlinePayment,
                                  groupValue: _character,
                                  onChanged:
                                      (PaymentMethodScreenRadioValues? value) {
                                    setState(() {
                                      _character = value;
                                      paymentMethod = 'Visa';
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(
                                            text: AppLocalizations.of(context)!
                                                .location,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          DefaultText(
                                            text: widget.paymentMethodScreenArgs
                                                .address,
                                            maxLines: 4,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 10, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(
                                            text: AppLocalizations.of(context)!
                                                .deliveryTime,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          DefaultText(
                                            text: dateFormat
                                                .format(DateTime.now())
                                                .toString(),
                                            maxLines: 4,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
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
                                    text: AppLocalizations.of(context)!
                                        .additionalDetailsForOrdering,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 20.0, bottom: 10.0, top: 10.0),
                                    child: DefaultText(
                                      text: AppLocalizations.of(context)!
                                          .orderCost,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 20.0, bottom: 10.0, top: 10.0),
                                    child: DefaultText(
                                      text:
                                          '${widget.paymentMethodScreenArgs.getMyCartModel.totalPrice} ${AppLocalizations.of(context)!.appCurrency}',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 20.0, bottom: 10.0),
                                    child: DefaultText(
                                      text: AppLocalizations.of(context)!
                                          .deliveryFees,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 20.0, bottom: 10.0),
                                    child: DefaultText(
                                      text:
                                          '${widget.paymentMethodScreenArgs.checkDistanceModel.deliveryPrice} ${AppLocalizations.of(context)!.appCurrency}',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 20.0, bottom: 10.0),
                                    child: DefaultText(
                                      text: AppLocalizations.of(context)!.total,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 20.0, bottom: 10.0),
                                    child: DefaultText(
                                      text:
                                          '${widget.paymentMethodScreenArgs.checkDistanceModel.deliveryPrice + widget.paymentMethodScreenArgs.getMyCartModel.totalPrice} ${AppLocalizations.of(context)!.appCurrency}',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                      child: BlocBuilder<MakeOrderCubit, MakeOrderState>(
                        builder: (context, state) {
                          _makeOrderCubit = MakeOrderCubit.get(context);
                          return InkWell(
                            onTap: () async{
                            if (paymentMethod  == 'Cash') {
                              await  _makeOrderCubit.userMakeOrder(
                                paymentMethod:
                                PaymentMethodScreenRadioValues.Cash.name,
                                makeOrderLocation: MakeOrderLocation(
                                    address: widget.paymentMethodScreenArgs
                                        .apiAddress?.address,
                                    longitude: widget.paymentMethodScreenArgs
                                        .apiAddress?.longitude
                                        .toDouble(),
                                    latitude: widget.paymentMethodScreenArgs
                                        .apiAddress?.latitude
                                        .toDouble()),
                                // extraDescription: widget.paymentMethodScreenArgs
                                //     .additionalInstructions,
                                deliveryTime: dateFormat
                                    .format(DateTime.now())
                                    .toString(),
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeLayout(),
                                ),
                                    (route) {
                                  return false;
                                },
                              );
                            }else {


                              showToastMsg(msg: 'Coming Soon', toastState: ToastStates.SUCCESS);

                            }

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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: DefaultText(
                                      text: (AppLocalizations.of(context)!
                                          .finishOrder),
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
                                    padding:
                                        EdgeInsetsDirectional.only(end: 1.0),
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
                          );
                        },
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

}
