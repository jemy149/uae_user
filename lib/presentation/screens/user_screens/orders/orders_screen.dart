import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/router/arguments/user_arguments/tracking_order_screen_args.dart';
import 'package:uae_user/presentation/views/user_orders_item.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

import '../../../../business_logic/user/get_orders/get_orders_cubit.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/DefaultSvg.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);

  late GetOrdersCubit _getOrdersCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOrdersCubit()..userGetOrders(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.lightBlue,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText(
                  text: AppLocalizations.of(context)!.myOrders,
                ),
              ],
            ),
          ),
          body: BlocBuilder<GetOrdersCubit, GetOrdersState>(
            builder: (context, state) {
              if (state is UserGetOrdersSuccessState) {
                _getOrdersCubit = GetOrdersCubit.get(context);
                return ListView.builder(
                  itemBuilder: (context, index) => UserOrdersItem(
                    index: index,
                    getOrdersModel: _getOrdersCubit.getOrdersModel,
                    onTap: () {
                      Navigator.pushNamed(context, TRACKING_ORDER_SCREEN_R,
                          arguments: TrackingOrderScreenArgs(
                              index: index,
                              getOrdersModel: _getOrdersCubit.getOrdersModel,

                          ));
                    },
                  ),
                  itemCount: _getOrdersCubit.getOrdersModel.orders.length,
                );
              } else if (state is UserGetOrdersLoadingState) {
                return const DefaultLoadingIndicator();
              } else if (state is UserGetOrdersEmptyState) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DefaultSvg(
                        imagePath: 'assets/icons/no_search_data.svg',
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
        ),
      ),
    );
  }
}
