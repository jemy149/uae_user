import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/data/models/user_models/get_offers/get_offers_model.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_cached_network_image.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

import '../../business_logic/user/add_to_cart/add_to_cart_cubit.dart';
import '../../constants/constant_methods.dart';
import '../../constants/enums.dart';
import '../../constants/screens.dart';

class HomeOffersCardItem extends StatelessWidget {
  final Offers offer;
  final int productId;


   HomeOffersCardItem({Key? key, required this.offer, required this.productId}) : super(key: key);

  late AddToCartCubit _cartCubit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushReplacementNamed(context, ADDING_PRODUCT_TO_CART_SCREEN_R,
            arguments:productId);
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
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 55.0),
                          child: DefaultMaterialButton(
                            text: AppLocalizations.of(context)!.offersAddButton,
                            onTap: () {
                              _cartCubit =
                            AddToCartCubit.get(context);
                            _cartCubit.userAddToCart(
                                productId: productId);
                            },
                            height: 25,
                            width: 60,
                            color: AppColors.lightBlue,
                            textColor: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        // const Icon(
                        //   Icons.favorite_outline,
                        //   color: AppColors.grey,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: DefaultText(
                    maxLines: 2,
                    text: offer.product.name,
                    style: Theme.of(context).textTheme.button?.copyWith(
                        fontFamily: 'Bukra-Regular', fontWeight: FontWeight.bold,fontSize: 14),
                  ),
                ),
              ],
            ),
            Text(
              '${offer.discount} ${AppLocalizations.of(context)!.appCurrency}',
              style: const TextStyle(decoration: TextDecoration.lineThrough),
            ),
            DefaultText(
              text: offer.discountStr,
            )
          ],
        ),
      ),
    );
  }
}
