import 'package:flutter/material.dart';
import 'package:uae_user/data/models/user_models/get_orders/get_orders_model.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OrderPricingOutlinedCardItem extends StatelessWidget {
  final Orders order;
  final int index;
  const OrderPricingOutlinedCardItem( {Key? key, required this.order, required this.index,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DefaultText(
              text: '${AppLocalizations.of(context)!.orderPrice} : ${order.bill.productsPrice} ${AppLocalizations.of(context)!.appCurrency}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontFamily: 'Bukra-Regular',fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 5),
              child: DefaultText(
                text: '${AppLocalizations.of(context)!.deliveryFees} : ${order.bill.deliveryPrice} ${AppLocalizations.of(context)!.appCurrency}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontFamily: 'Bukra-Regular',fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 5),
              child: Row(
                children: [
                  DefaultText(
                    text: '${AppLocalizations.of(context)!.discount} : ',
                    style: Theme.of(context).textTheme.button,
                  ),
                  DefaultText(
                    text: '${order.bill.discounted} ${AppLocalizations.of(context)!.appCurrency}',
                    style: Theme.of(context).textTheme.button?.copyWith(decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 5),
              child: DefaultText(
                text: '${AppLocalizations.of(context)!.total} : ${order.bill.totalPrice} ${AppLocalizations.of(context)!.appCurrency}',
                style: Theme.of(context).textTheme.headline6?.copyWith(color: AppColors.green,fontFamily:'Bukra-Regular'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
