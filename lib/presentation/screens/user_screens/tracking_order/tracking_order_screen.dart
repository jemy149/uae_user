import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_user/presentation/router/arguments/user_arguments/delivery_information_screen_args.dart';
import 'package:uae_user/presentation/router/arguments/user_arguments/tracking_order_screen_args.dart';
import 'package:uae_user/presentation/screens/user_screens/delivery_information/delivery_information_screen.dart';
import 'package:uae_user/presentation/views/an_ordered_card_ietm.dart';
import 'package:uae_user/presentation/views/order_pricing_outlined_card_item.dart';
import 'package:uae_user/presentation/views/tracking_order_details_item.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class TrackingOrderScreen extends StatelessWidget {
  final TrackingOrderScreenArgs trackingOrderScreenArgs;

  const TrackingOrderScreen({
    Key? key,
    required this.trackingOrderScreenArgs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
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
              child: Image.asset(
                'assets/images/whiteLogo.png',
                height: 60,
                width: 60,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultText(
                text:
                    '${AppLocalizations.of(context)!.orderNo} # ${trackingOrderScreenArgs.getOrdersModel.orders[trackingOrderScreenArgs.index].code}',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontFamily: 'Bukra-Regular', fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/icons/icon.png',
                height: 60,
                width: 60,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 10),
                child: SizedBox(
                  height: 30.h,
                  child: ListView.builder(
                    itemCount: trackingOrderScreenArgs.getOrdersModel.orders[trackingOrderScreenArgs.index].carts.length,
                    itemBuilder: (context, index) => AnOrderedCardItem(order: trackingOrderScreenArgs.getOrdersModel.orders[trackingOrderScreenArgs.index],index: index),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    TrackingOrderDetailsItem(
                        titleText:
                            AppLocalizations.of(context)!.addressAndLocation,
                        subTitleText: trackingOrderScreenArgs.getOrdersModel.orders[trackingOrderScreenArgs.index].orderLocation.address),
                    TrackingOrderDetailsItem(
                        titleText: AppLocalizations.of(context)!.paymentMethod,
                        subTitleText: trackingOrderScreenArgs.getOrdersModel.orders[trackingOrderScreenArgs.index].paymentMethod),
                    TrackingOrderDetailsItem(
                        titleText: AppLocalizations.of(context)!.driverName,
                        subTitleText: 'NO Phone'),
                    TrackingOrderDetailsItem(
                        titleText: AppLocalizations.of(context)!.driverPhone,
                        subTitleText: 'NO Driver'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [OrderPricingOutlinedCardItem(order: trackingOrderScreenArgs.getOrdersModel.orders[trackingOrderScreenArgs.index],index: trackingOrderScreenArgs.index,)],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultMaterialButton(
                      text: AppLocalizations.of(context)!.trackMyOrder,
                      onTap: () {

                        Navigator.pushNamed(
                            context, DELIVERY_INFORMATION_SCREEN_R,arguments:DeliveryInformationScreenArgs(getOrdersModel:  trackingOrderScreenArgs.getOrdersModel, index: trackingOrderScreenArgs.index),);
                      },
                      textColor: Colors.white,
                      color: AppColors.lightBlue,
                      height: 50,
                      width: 200,
                      fontSize: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
