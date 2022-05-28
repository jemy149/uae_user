import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/data/requests/search/price_model.dart';
import 'package:uae_user/presentation/views/products_in_stock_item.dart';
import '../../../../business_logic/user/home_product_search/home_product_search_cubit.dart';
import '../../../styles/colors.dart';
import '../../../widgets/DefaultSvg.dart';
import '../../../widgets/custome_search_field.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_text.dart';

class BarcodeResultScreen extends StatefulWidget {
  final int? searchBarCode;
  final List? brandId;
  final int? categoryId;
  final Price? rangPrice;

  const BarcodeResultScreen({Key? key, this.searchBarCode, this.brandId, this.categoryId, this.rangPrice, }) : super(key: key);

  @override
  State<BarcodeResultScreen> createState() => _BarcodeResultScreenState();
}

class _BarcodeResultScreenState extends State<BarcodeResultScreen> {

  final ScrollController productGridController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProductSearchCubit()
        ..userBarcodeProductSearch(barcode: widget.searchBarCode, page: 0,),
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsetsDirectional.only(end: 60),
                    child: DefaultText(
                      text: AppLocalizations.of(context)!.search,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontFamily: 'Bukra-Regular',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
          body: 
          BlocBuilder<UserProductSearchCubit, UserProductSearchStates>(
            builder: (context, state) {
              UserProductSearchCubit  searchCubit = UserProductSearchCubit.get(context);
              productGridController.addListener(() {
                if (productGridController.position.pixels >=
                    productGridController.position.maxScrollExtent &&
                    !searchCubit.isLoadingMoreData) {

                  searchCubit.userProductSearch(
                      barcode: widget.searchBarCode, page: searchCubit.nextPage);
                }
              });
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: BlocBuilder<UserProductSearchCubit,
                          UserProductSearchStates>(
                        builder: (context, state) {
                          if (state is UserProductBarcodeSearchSuccessState) {
                            return GridView.count(
                              controller: productGridController,
                                crossAxisCount: 2,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6,
                                childAspectRatio: 1 / 1.4,
                                children:
                                List.generate(
                                    searchCubit.userBarcodeSearchModel.products.length,
                                        (index) => ProductsInStockItem(
                                        productModel: searchCubit
                                            .userBarcodeSearchModel
                                            .products[index])));
                          } else if (state is UserProductBarcodeSearchLoadingState) {
                            return const DefaultLoadingIndicator();
                          } else if (state is UserProductBarcodeSearchEmptyState) {
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
                                    text: AppLocalizations.of(context)!.noResultsFound,
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
                    ),
                  )
                ],
              );
            },
),
        ),
      ),
    );
  }
}
