import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/constants/enums.dart';
import 'package:uae_user/data/models/user_models/get_offers/get_offers_model.dart';
import 'package:uae_user/presentation/router/arguments/user_arguments/adding_favourite_product_to_cart_screen_args.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_cached_network_image.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

import '../../business_logic/user/add_to_cart/add_to_cart_cubit.dart';
import '../../constants/screens.dart';

class HomeOffersCardItem extends StatelessWidget {
  final Offers offer;
  final int productId;

  HomeOffersCardItem({Key? key, required this.offer, required this.productId})
      : super(key: key);
  late double totalPriceAfterMakeOffer;
  late AddToCartCubit _cartCubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        printTest(totalPriceAfterMakeOffer.toString());
        Navigator.pushReplacementNamed(context, ADDING_FAVOURITE_PRODUCT_TO_CART_SCREEN_R,
            arguments: AddingFavouriteProductToCartScreenArgs(productId: productId, discount: totalPriceAfterMakeOffer));
      },
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 15.0),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: DefaultCachedNetworkImage(
                            imageUrl: offer.product.images[0],
                            fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 8.0, start: 5.0, end: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: SizedBox(
                width: 150,
                child: DefaultText(
                  maxLines: 2,
                  text: offer.product.name,
                  style: Theme.of(context).textTheme.button?.copyWith(
                      fontFamily: 'Bukra-Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 1,
                            color: AppColors.grey,
                          ),
                        ),
                        child: const Icon(
                          Icons.add_shopping_cart_outlined,
                          color: AppColors.lightBlue,
                        ),
                      ),
                      onTap: () {
                        _cartCubit = AddToCartCubit.get(context);
                        _cartCubit.userAddToCart(productId: productId,quantity: 1);
                      },
                    ),
                    Flexible(
                      child: Text(
                        offer.discountStr,
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Builder(builder: (context) {
              totalPriceAfterMakeOffer =
                  offer.price - (offer.price * offer.discount / 100);
              return DefaultText(
                text:
                    '${totalPriceAfterMakeOffer.toStringAsFixed(2)} ${AppLocalizations.of(context)!.appCurrency}',
              );
            })
          ],
        ),
      ),
    );
  }
}
