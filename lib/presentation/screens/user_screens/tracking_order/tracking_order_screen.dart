import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_user/business_logic/user/cart/get_my_cart/get_my_cart_cubit.dart';
import 'package:uae_user/presentation/views/an_ordered_card_ietm.dart';
import 'package:uae_user/presentation/views/order_pricing_outlined_card_item.dart';
import 'package:uae_user/presentation/views/tracking_order_details_item.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';
import '../../../../business_logic/user/get_orders/get_orders_cubit.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/DefaultSvg.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_text.dart';


class TrackingOrderScreen extends StatelessWidget {
   TrackingOrderScreen({Key? key}) : super(key: key);
  late GetOrdersCubit _getOrdersCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => GetOrdersCubit()..userGetOrders(),
  child: SafeArea(
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
      body: BlocBuilder<GetOrdersCubit, GetOrdersState>(
  builder: (context, state) {
    if (state is UserGetOrdersSuccessState) {
      _getOrdersCubit = GetOrdersCubit.get(context);
      return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultText(
                  text: '${AppLocalizations.of(context)!.orderNo} # ${667997}',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(
                      fontFamily: 'Bukra-Regular',
                      fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/icons/icon.png',height: 60,width: 60,),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 10
                  ),
                  child: SizedBox(
                    height: 30.h,
                    child: ListView.builder(
                      itemCount: _getOrdersCubit.getOrdersModel.orders.length,
                      itemBuilder: (context,index)=> AnOrderedCardItem(order:_getOrdersCubit.getOrdersModel.orders[index]),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      TrackingOrderDetailsItem(
                          titleText: AppLocalizations.of(context)!.addressAndLocation,
                          subTitleText: 'mostafa ramdan'),
                      TrackingOrderDetailsItem(
                          titleText: AppLocalizations.of(context)!.paymentMethod,
                          subTitleText: 'cash'),
                      TrackingOrderDetailsItem(
                          titleText: AppLocalizations.of(context)!.driverName,
                          subTitleText: 'No Driver'),
                      TrackingOrderDetailsItem(
                          titleText: AppLocalizations.of(context)!.driverPhone,
                          subTitleText: 'No Driver'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const [OrderPricingOutlinedCardItem()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultMaterialButton(
                        text: AppLocalizations.of(context)!.trackMyOrder,
                        onTap: () {Navigator.pushNamed(context, DELIVERY_INFORMATION_SCREEN_R);},
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
        );
    }else if (state is UserGetOrdersLoadingState) {
      return const DefaultLoadingIndicator();
    } else if (state is UserGetOrdersEmptyState) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DefaultSvg(
              imagePath:
              'assets/icons/no_search_data.svg',

            ),
            DefaultText(
              text: 'لم يتم العثور على نتائج',

              textStyle:
              Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      );
    } else {
      return const DefaultErrorWidget();
    }
  },
),
    )),
);
  }
}
