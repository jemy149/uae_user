import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/cart/delete_cart/delete_cart_cubit.dart';
import 'package:uae_user/presentation/screens/user_screens/app_layout/home_layout.dart';
import 'package:uae_user/presentation/views/cart_item.dart';

import '../../../../business_logic/user/cart/get_my_cart/get_my_cart_cubit.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/DefaultSvg.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late GetMyCartCubit _getMyCartCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetMyCartCubit()..userGetCart(),
        ),
        BlocProvider(
          create: (context) => DeleteCartCubit(),
        ),
      ],
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.lightBlue,
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
              // Navigator.pop(context);
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.only(end: 60),
                  child: DefaultText(
                    text: AppLocalizations.of(context)!.cart,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: 'Bukra-Regular',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  )),
            ],
          ),
        ),
        body: BlocListener<DeleteCartCubit, DeleteCartState>(
          listener: (context, state) {
            if (state is UserDeleteCartSuccessState) {
              _getMyCartCubit.userGetCart();
            //   setState(() {
            //     _getMyCartCubit.getMyCartModel.carts
            //         .removeWhere((element) => element.id == state.cartId);
            //   });
            }
          },
          child: BlocBuilder<GetMyCartCubit, GetMyCartState>(
            builder: (context, state) {
              if (state is UserGetCartSuccessState) {
                _getMyCartCubit = GetMyCartCubit.get(context);
                return Column(
                  children: [
                    Flexible(
                        flex: 10,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                itemBuilder: (context, index) => CartItem(
                                  getMyCartModel: state.carts[index],
                                ),
                                itemCount: state.carts.length,
                              )),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: DefaultText(
                                      text: AppLocalizations.of(context)!.total,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: DefaultText(
                                      text:
                                          '${_getMyCartCubit.getMyCartModel.totalPrice.toStringAsFixed(2)} ${AppLocalizations.of(context)!.appCurrency}',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              )
                            ],
                          ),
                        )),
                    Flexible(
                        flex: 2,
                        child: Container(
                          color: AppColors.lightBlue,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, DELIVERY_DETAILS_SCREEN_R);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: DefaultText(
                                        text: (AppLocalizations.of(context)!
                                            .completeOrder),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                              fontFamily: 'Bukra-Regular',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(end: 1.0),
                                      child: CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.lightBlue,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                );
              } else if (state is UserGetCartLoadingState) {
                return const DefaultLoadingIndicator();
              } else if (state is UserGetCartEmptyState) {
                return Center(
                  child: Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const DefaultSvg(
                          imagePath: 'assets/icons/no_search_data.svg',
                          color: AppColors.lightBlue2,
                        ),
                        DefaultText(
                          text: AppLocalizations.of(context)!.noResultsFound,
                          style: const TextStyle(color: Colors.white),
                          textStyle: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const DefaultErrorWidget();
              }
            },
          ),
        ),
      )),
    );
  }
}
