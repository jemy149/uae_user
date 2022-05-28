import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/views/products_in_stock_item.dart';
import '../../../../business_logic/user/home_product_search/home_product_search_cubit.dart';
import '../../../styles/colors.dart';
import '../../../widgets/DefaultSvg.dart';
import '../../../widgets/custome_search_field.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_text.dart';

class SearchScreen extends StatefulWidget {
  final String? searchText;


  const SearchScreen({Key? key, this.searchText,}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
   final TextEditingController _searchController = TextEditingController();
  final ScrollController productGridController = ScrollController();


  @override
  void initState() {
    _searchController.text = widget.searchText ?? '';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  late UserProductSearchCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProductSearchCubit()
        ..userProductSearch(keyword: _searchController.text, page: 1,),
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
          body: BlocConsumer<UserProductSearchCubit, UserProductSearchStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {

              searchCubit = UserProductSearchCubit.get(context);
              productGridController.addListener(() {
                if (productGridController.position.pixels >=
                    productGridController.position.maxScrollExtent &&
                    !searchCubit.isLoadingMoreData) {

                  searchCubit.userProductSearch(
                      keyword: _searchController.text, page: searchCubit.nextPage);
                }
              });
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    child: CustomeSearchField(
                      keyboardType: TextInputType.text,
                      prefixIcon: IconButton(
                        icon: Image.asset('assets/images/search.png'),
                        onPressed: () {},
                      ),
                      controller: _searchController,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'البحث فارغ';
                        }
                      },
                      onFieldSubmitted: (text) {
                        searchCubit.userProductSearch(
                            keyword: _searchController.text, page: 1);
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: BlocBuilder<UserProductSearchCubit,
                          UserProductSearchStates>(
                        builder: (context, state) {
                          if (state is UserProductSearchSuccessState) {
                            return GridView.count(
                              controller: productGridController,
                              crossAxisCount: 2,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 6,
                              childAspectRatio: 1 / 1.4,
                              children: List.generate(
                                  searchCubit
                                      .userSearchModel.products.length,
                                      (index) => ProductsInStockItem(
                                      productModel: searchCubit
                                          .userSearchModel
                                          .products[index])),
                            );
                          } else if (state is UserProductSearchLoadingState) {
                            return const DefaultLoadingIndicator();
                          } else if (state is UserProductSearchEmptyState) {
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const DefaultSvg(
                                    imagePath:
                                    'assets/icons/no_search_data.svg',

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
