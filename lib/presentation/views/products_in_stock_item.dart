import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uae_user/business_logic/user/change_favorite/favorite_change_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/constants/weights.dart';
import 'package:uae_user/data/models/user_models/search/search_model.dart';
import '../../business_logic/user/add_to_cart/add_to_cart_cubit.dart';
import '../../constants/screens.dart';
import '../styles/colors.dart';
import '../widgets/default_cached_network_image.dart';
import '../widgets/default_text.dart';

class ProductsInStockItem extends StatefulWidget {
  final Products productModel;

  const ProductsInStockItem({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductsInStockItem> createState() => _ProductsInStockItemState();
}

class _ProductsInStockItemState extends State<ProductsInStockItem> {
  bool favClicked=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, ADDING_PRODUCT_TO_CART_SCREEN_R,
            arguments: widget.productModel.id);
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
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: DefaultCachedNetworkImage(
                        imageUrl: widget.productModel.images.isEmpty
                            ? ''
                            : widget.productModel.images[0],
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 8.0, start: 5.0, end: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocListener<ChangeFavoriteCubit, ChangeFavoriteStates>(
                          listener: (context, state) {
                            if(state is FavoriteChangeSuccessState){
                              favClicked=false;

                              if(widget.productModel.id==state.productId){
                                setState(() {
                                  widget.productModel.setIsFav= !widget.productModel.isFav;
                                });
                              }
                            }
                            else if (state is FavoriteChangeErrorState){
                              favClicked=false;
                            }
                          },
                          child: InkWell(onTap: () {

                            if (!favClicked) {
                              favClicked=true;
                              ChangeFavoriteCubit.get(context).changeFavorite(
                                productId: widget.productModel.id,
                              );
                            }
                          },
                            child: widget.productModel.isFav==false?const Icon(
                               Icons.favorite_outline,
                              color: AppColors.grey,
                            ):const Icon(
                              Icons.favorite,
                              color: AppColors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Flexible(
                      child: InkWell(
                          onTap: () {
                            AddToCartCubit.get(context).userAddToCart(
                                productId: widget.productModel.id);
                          },
                          child: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: AppColors.lightBlue,
                          ))),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: DefaultText(
                                  maxLines: 2,
                                  text: widget.productModel.name,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .button
                                      ?.copyWith(
                                      fontFamily: 'Bukra-Regular',
                                      fontSize: 12,fontWeight: FontWeights.bold),
                                ),
                              )
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DefaultText(
                                text: '${widget.productModel.price.toStringAsFixed(2)} ${AppLocalizations.of(context)!.appCurrency}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
