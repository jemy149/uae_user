import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/constants/enums.dart';
import 'package:uae_user/presentation/router/arguments/user_arguments/adding_favourite_product_to_cart_screen_args.dart';
import 'package:uae_user/presentation/widgets/default_cached_network_image.dart';
import '../../../../business_logic/user/add_to_cart/add_to_cart_cubit.dart';
import '../../../../business_logic/user/change_favorite/favorite_change_cubit.dart';
import '../../../../business_logic/user/get_products/get_products_cubit.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/DefaultSvg.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_material_button.dart';
import '../../../widgets/default_text.dart';

class AddingFavouriteProductToCartScreen extends StatefulWidget {
 final AddingFavouriteProductToCartScreenArgs addingFavouriteProductToCartScreenArgs ;
  const AddingFavouriteProductToCartScreen({Key? key, required this.addingFavouriteProductToCartScreenArgs,})
      : super(key: key);

  @override
  State<AddingFavouriteProductToCartScreen> createState() =>
      _AddingFavouriteProductToCartScreenState();
}

 GetProductsCubit _getProductsCubit = GetProductsCubit();

class _AddingFavouriteProductToCartScreenState extends State<AddingFavouriteProductToCartScreen> {
  bool favClicked = false;


  late int productQuantity;
  List<int> listOfQuantities = [];
  List<bool> listOfCheckBoxesValue = [];

  @override
  void initState() {
    super.initState();
    productQuantity = 1;

    if (_getProductsCubit.getProductsModel.product.prices.isEmpty) {
      productQuantity = 1;
      // productQuantity = _getProductsCubit.getProductsModel.product.quantity;
    } else {
      listOfCheckBoxesValue=List.generate(_getProductsCubit.getProductsModel.product.prices.length, (index) => false);

      for (var element in _getProductsCubit.getProductsModel.product.prices) {
        listOfQuantities.add(element.quantity);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [

          BlocProvider(
            create: (context) => GetProductsCubit()
              ..userGetProducts(productId: widget.addingFavouriteProductToCartScreenArgs.productId),
          ),
        ],
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.lightBlue,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HOME_LAYOUT_R,
                      (route) => false,
                );
              },
            ),
          ),
          backgroundColor: AppColors.lightBlue,
          body: BlocBuilder<GetProductsCubit, GetProductsState>(
            builder: (context, state) {
              _getProductsCubit = GetProductsCubit.get(context);

              if (state is UserGetProductsSuccessState) {
                return ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 300,
                          width: double.maxFinite,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                              )),
                          child: Center(
                              child: DefaultCachedNetworkImage(
                                  imageUrl: _getProductsCubit.getProductsModel
                                          .product.images.isEmpty
                                      ? ''
                                      : _getProductsCubit
                                          .getProductsModel.product.images[0],
                                  fit: BoxFit.contain)),
                        ),
                        Positioned(
                          top: 20.0,
                          right: 20.0,
                          child: BlocListener<ChangeFavoriteCubit,
                              ChangeFavoriteStates>(
                            listener: (context, state) {
                              if (state is FavoriteChangeSuccessState) {
                                favClicked = false;
                                if (_getProductsCubit
                                        .getProductsModel.product.id ==
                                    state.productId) {
                                  setState(() {
                                    printTest(  _getProductsCubit
                                        .getProductsModel.product.isFav.toString());
                                    _getProductsCubit
                                            .getProductsModel.product.setIsFav =
                                        !_getProductsCubit
                                            .getProductsModel.product.isFav;
                                  });
                                }
                              } else if (state is FavoriteChangeErrorState) {
                                favClicked = false;
                              }
                            },
                            child: InkWell(
                              onTap: () {
                                if (!favClicked) {
                                  favClicked = true;
                                  ChangeFavoriteCubit.get(context)
                                      .changeFavorite(
                                    productId: _getProductsCubit
                                        .getProductsModel.product.id,
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.lightBlue),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: _getProductsCubit
                                              .getProductsModel.product.isFav ==
                                          false
                                      ? const Icon(
                                          Icons.favorite_outline,
                                          color: AppColors.grey,
                                        )
                                      : const Icon(
                                          Icons.favorite,
                                          color: AppColors.red,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 12.0, top: 10.0, end: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText(
                                    maxLines: 4,
                                    text: _getProductsCubit
                                        .getProductsModel.product.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Bukra-Regular'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: DefaultText(
                                      text: _getProductsCubit
                                          .getProductsModel.product.description,
                                      maxLines: 4,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                            color: Colors.white70,
                                          ),
                                    ),
                                  ),
                                  DefaultText(
                                    text:
                                        '${widget.addingFavouriteProductToCartScreenArgs.discount.toStringAsFixed(2)} ${AppLocalizations.of(context)!.appCurrency}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 12.0),
                              child: _getProductsCubit.getProductsModel.product.prices.isEmpty
                                  ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 30,
                                        child: CheckboxListTile(
                                          value: true,
                                          onChanged: (p) {},
                                          title: DefaultText(
                                            text: _getProductsCubit.getProductsModel.product.name,
                                            maxLines: 10,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(color: Colors.white),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          controlAffinity: ListTileControlAffinity.leading,


                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        flex: 40,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.lightBlue,
                                              borderRadius: BorderRadius.circular(15)),
                                          padding: const EdgeInsets.symmetric(horizontal: 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  decrementProductQuantity();
                                                },
                                                child: const CircleAvatar(
                                                  backgroundColor: AppColors.black,
                                                  radius: 15.2,
                                                  child: CircleAvatar(
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    ),
                                                    backgroundColor: AppColors.lightBlue,
                                                    radius: 15,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: DefaultText(
                                                  text: productQuantity.toString(),
                                                  style:
                                                  Theme.of(context).textTheme.bodyText1?.copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  incrementProductQuantity();
                                                },
                                                child: const CircleAvatar(
                                                  backgroundColor: AppColors.black,
                                                  radius: 15.2,
                                                  child: CircleAvatar(
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                    backgroundColor: AppColors.lightBlue,
                                                    radius: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Spacer(flex: 5,),
                                      Flexible(
                                        flex: 30,
                                        child: DefaultText(
                                          text:
                                          '${(widget.addingFavouriteProductToCartScreenArgs.discount*productQuantity).toStringAsFixed(2)} ${AppLocalizations.of(context)!.appCurrency}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                                  : Column(
                                children: List.generate(
                                    listOfQuantities.length,
                                        (index) => Column(
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              flex: 30,
                                              child: SizedBox(
                                                child: CheckboxListTile(
                                                  value: listOfCheckBoxesValue[index],
                                                  onChanged: (value) {
                                                    setState(() {
                                                      listOfCheckBoxesValue[index]=value!;
                                                    });
                                                  },
                                                  title: DefaultText(
                                                    text:
                                                    _getProductsCubit.getProductsModel.product.prices[index].name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1
                                                        ?.copyWith(color: Colors.white),
                                                  ),
                                                  contentPadding: EdgeInsets.zero,
                                                  controlAffinity: ListTileControlAffinity.leading,
                                                ),
                                                width: 100,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 40,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.lightBlue,
                                                    borderRadius: BorderRadius.circular(15)),
                                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (listOfCheckBoxesValue[index]) {
                                                          setState(() {
                                                            if (listOfQuantities[index] > 1) {
                                                              listOfQuantities[index]--;
                                                            }
                                                          });
                                                        }
                                                      },
                                                      child: const CircleAvatar(
                                                        backgroundColor: AppColors.black,
                                                        radius: 15.2,
                                                        child: CircleAvatar(
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: Colors.white,
                                                          ),
                                                          backgroundColor: AppColors.lightBlue,
                                                          radius: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: 8.0),
                                                      child: DefaultText(
                                                        text: listOfQuantities[index].toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            ?.copyWith(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        if (listOfCheckBoxesValue[index]) {
                                                          setState(() {
                                                            if (listOfQuantities[index] < 99) {
                                                              listOfQuantities[index]++;
                                                            }
                                                          });
                                                        }
                                                      },
                                                      child: const CircleAvatar(
                                                        backgroundColor: AppColors.black,
                                                        radius: 15.2,
                                                        child: CircleAvatar(
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                          backgroundColor: AppColors.lightBlue,
                                                          radius: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Spacer(flex: 5,),
                                            Flexible(
                                              flex: 30,
                                              child: DefaultText(
                                                text:
                                                '${(_getProductsCubit.getProductsModel.product.prices[index].price* listOfQuantities[index]).toStringAsFixed(2)} ${AppLocalizations.of(context)!.appCurrency}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    ?.copyWith(color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Builder(builder: (context) {
                                    AddToCartCubit _cartCubit =
                                        AddToCartCubit.get(context);
                                    return BlocListener<AddToCartCubit,
                                        AddToCartState>(
                                      listener: (context, state) {
                                        if (state is UserAddToCartSuccessStates) {
                                          showToastMsg(
                                              msg: AppLocalizations.of(context)!.addedSuccessfully,
                                              toastState: ToastStates.SUCCESS);
                                        }else if (state is UserAddToCartNotAvailableStates) {
                                          showToastMsg(
                                              msg: AppLocalizations.of(context)!.notAvailable,
                                              toastState: ToastStates.WARNING);
                                        }
                                      },
                                      child: DefaultMaterialButton(
                                        text: AppLocalizations.of(context)!
                                            .addToCart,
                                        onTap: () {
                                          _cartCubit.userAddToCart(
                                            quantity:productQuantity,
                                              productId: widget.addingFavouriteProductToCartScreenArgs.productId);
                                          printTest(productQuantity.toString());
                                        },
                                        height: 50,
                                        width: 260,
                                        color: Colors.white,
                                        textColor: AppColors.lightBlue,
                                      ),
                                    );
                                  })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else if (state is UserGetProductsLoadingState) {
                return const DefaultLoadingIndicator(color: Colors.white,);
              } else if (state is UserGetProductsEmptyState) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DefaultSvg(
                        imagePath: 'assets/icons/no_search_data.svg',
                        color: AppColors.lightBlue2,
                      ),
                      DefaultText(
                        text: AppLocalizations.of(context)!.noResultsFound,
                        textStyle: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                );
              } else {
                return const DefaultErrorWidget();
              }
            },
          ),
        )));
  }

  incrementProductQuantity() {
    setState(() {
      if (productQuantity < 99) {
        productQuantity++;
      } else {}
    });
  }

  decrementProductQuantity() {
    setState(() {
      if (productQuantity > 1) {
        productQuantity--;
      } else {}
    });
  }
}
