import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/add_to_cart/add_to_cart_cubit.dart';
import 'package:uae_user/business_logic/user/change_favorite/favorite_change_cubit.dart';
import 'package:uae_user/constants/screens.dart';
import 'package:uae_user/data/models/user_models/favorites/favorites_model.dart';
import 'package:uae_user/presentation/widgets/default_cached_network_image.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class UserFavouritesItem extends StatefulWidget {
  final Products productModel;
  final int productId;

  const UserFavouritesItem({
    Key? key,
    required this.productModel, required this.productId,
  }) : super(key: key);

  @override
  State<UserFavouritesItem> createState() => _UserFavouritesItemState();
}

class _UserFavouritesItemState extends State<UserFavouritesItem> {

  late ChangeFavoriteCubit _changeFavoriteCubit;
  @override
  void initState() {
    _changeFavoriteCubit=ChangeFavoriteCubit.get(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushReplacementNamed(context, ADDING_PRODUCT_TO_CART_SCREEN_R,
            arguments:widget.productId);
      },
      child: Column(
        children: [
          SizedBox(
            height: 160,
            width: 150,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: 160,
                      width: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(25)),
                      child: DefaultCachedNetworkImage(
                          imageUrl: widget.productModel.images.isEmpty
                              ? ''
                              : widget.productModel.images[0],
                          fit: BoxFit.cover)),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, top: 15),
                      child: InkWell(
                        onTap: () {
                          _changeFavoriteCubit.changeFavorite(productId: widget.productModel.id,);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10, top: 15),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          AddToCartCubit.get(context).userAddToCart(productId: widget.productId);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.add_shopping_cart_rounded,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10),
                child: DefaultText(
                  textAlign: TextAlign.center,
                  text:
                  widget.productModel.name,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontFamily: 'Bukra-Regular',
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultText(
                      text: AppLocalizations.of(context)!.price,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                     Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5),
                      child: DefaultText(text: '(${widget.productModel.price})'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
