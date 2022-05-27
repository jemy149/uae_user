import 'package:flutter/material.dart';
import 'package:uae_user/constants/weights.dart';
import 'package:uae_user/data/models/user_models/cart/get_my_cart_model.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_cached_network_image.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PaymentMethodItem extends StatelessWidget {
  final int index;
  final GetMyCartModel getMyCartModel;
  const PaymentMethodItem({Key? key, required this.getMyCartModel, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 5,
        child: Row(
          children: [
            Flexible(
              child: DefaultCachedNetworkImage(imageUrl: getMyCartModel.carts[index].product.images[index], fit: BoxFit.contain),
            ),
            Expanded(
              flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  DefaultText(
                    text: getMyCartModel.carts[index].product.name,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeights.bold,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: DefaultText(
                      text: '${getMyCartModel.carts[index].product.price} ${AppLocalizations.of(context)!.appCurrency}',
                      style: Theme.of(context).textTheme.caption
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                      child: DefaultText(
                        text: '${getMyCartModel.carts[index].product.quantity}',
                        style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.white)
                      ),
                    ),
                  ),

              ],
            ),
                ))
          ],
        ),
      ),
    );
  }
}
