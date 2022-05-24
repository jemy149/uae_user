import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/constants/enums.dart';
import 'package:uae_user/presentation/widgets/default_cached_network_image.dart';

import '../../../../business_logic/user/add_to_cart/add_to_cart_cubit.dart';
import '../../../../business_logic/user/get_products/get_products_cubit.dart';
import '../../../styles/colors.dart';
import '../../../widgets/DefaultSvg.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_material_button.dart';
import '../../../widgets/default_text.dart';

class AddingProductToCartScreen extends StatefulWidget {
  final int productId;

  const AddingProductToCartScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<AddingProductToCartScreen> createState() =>
      _AddingProductToCartScreenState();
}

class _AddingProductToCartScreenState extends State<AddingProductToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddToCartCubit(),
        ),
        BlocProvider(
          create: (context) => GetProductsCubit()..userGetProduct(productId: widget.productId),
        ),
      ],
      child: BlocProvider(
        create: (context) => GetProductsCubit(),
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.lightBlue,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: AppColors.lightBlue,
          body: BlocBuilder<GetProductsCubit, GetProductsState>(
            builder: (context, state) {
              if (state is UserGetProductsSuccessState) {
                return ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 300,
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                              )),
                          child: Center(
                              child: DefaultCachedNetworkImage(
                                  imageUrl: state.products.images[0], fit: BoxFit.contain)),
                        ),
                        Positioned(
                          top: 20.0,
                          right: 20.0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.lightBlue),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(25)),
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
                                      text: state.products.name,
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
                                        text:
                                            state.products.description,
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
                                      text: '${state.products.price} AED',
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: CheckboxListTile(
                                            value: true,
                                            onChanged: (p) {},
                                            title: DefaultText(
                                              text: 'item',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  ?.copyWith(color: Colors.white),
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                          width: 100,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.lightBlue,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const CircleAvatar(
                                                backgroundColor: AppColors.black,
                                                radius: 15.2,
                                                child: CircleAvatar(
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                  ),
                                                  backgroundColor:
                                                      AppColors.lightBlue,
                                                  radius: 15,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: DefaultText(
                                                  text: '${1}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                              const CircleAvatar(
                                                backgroundColor: AppColors.black,
                                                radius: 15.2,
                                                child: CircleAvatar(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                  backgroundColor:
                                                      AppColors.lightBlue,
                                                  radius: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        DefaultText(
                                          text: '${1200} AED',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: CheckboxListTile(
                                            value: true,
                                            onChanged: (p) {},
                                            title: DefaultText(
                                              text: 'item',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  ?.copyWith(color: Colors.white),
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                          width: 100,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.lightBlue,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const CircleAvatar(
                                                backgroundColor: AppColors.black,
                                                radius: 15.2,
                                                child: CircleAvatar(
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                  ),
                                                  backgroundColor:
                                                      AppColors.lightBlue,
                                                  radius: 15,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: DefaultText(
                                                  text: '${1}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                              const CircleAvatar(
                                                backgroundColor: AppColors.black,
                                                radius: 15.2,
                                                child: CircleAvatar(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                  backgroundColor:
                                                      AppColors.lightBlue,
                                                  radius: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        DefaultText(
                                          text: '${1200} AED',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: CheckboxListTile(
                                            value: true,
                                            onChanged: (p) {},
                                            title: DefaultText(
                                              text: 'item',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  ?.copyWith(color: Colors.white),
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                          width: 100,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.lightBlue,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const CircleAvatar(
                                                backgroundColor: AppColors.black,
                                                radius: 15.2,
                                                child: CircleAvatar(
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                  ),
                                                  backgroundColor:
                                                      AppColors.lightBlue,
                                                  radius: 15,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: DefaultText(
                                                  text: '${1}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                              const CircleAvatar(
                                                backgroundColor: AppColors.black,
                                                radius: 15.2,
                                                child: CircleAvatar(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                  backgroundColor:
                                                      AppColors.lightBlue,
                                                  radius: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        DefaultText(
                                          text: '${1200} AED',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ],
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
                                          CartState>(
                                        listener: (context, state) {
                                          if (state is UserAddCartSuccessStates) {
                                            showToastMsg(
                                                msg: 'Added Successfully',
                                                toastState: ToastStates.SUCCESS);
                                          }
                                        },
                                        child: DefaultMaterialButton(
                                          text: AppLocalizations.of(context)!
                                              .addToCart,
                                          onTap: () {
                                            _cartCubit.userAddToCart(
                                                productId: widget.productId);
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
                      ),
                    )
                  ],
                );
              } else if (state is UserGetProductsLoadingState) {
                return const DefaultLoadingIndicator();
              } else if (state is UserGetProductsEmptyState) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DefaultSvg(
                        imagePath:
                        'assets/icons/no_search_data.svg',
                        color: AppColors.lightBlue2,
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
      ),
    );
  }
}
