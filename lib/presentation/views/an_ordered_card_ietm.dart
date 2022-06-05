import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/data/models/user_models/get_orders/get_orders_model.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_cached_network_image.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class AnOrderedCardItem extends StatelessWidget {
  final Orders order;
  final int index;

  const AnOrderedCardItem({Key? key, required this.order, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                child: DefaultCachedNetworkImage(
                    imageUrl: order.carts[index].product.images[0],
                    fit: BoxFit.contain)),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5),
                  child: DefaultText(
                    text: order.carts[index].product.name,
                    maxLines: 2,
                  ),
                )),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: AppColors.grey,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: DefaultText(
                    text: '${order.carts[index].quantity}',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: AppColors.grey),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: DefaultText(
                    text:
                        '${order.carts[index].product.price.toStringAsFixed(2)} ${AppLocalizations.of(context)!.appCurrency}',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          color: AppColors.green,
                        ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
