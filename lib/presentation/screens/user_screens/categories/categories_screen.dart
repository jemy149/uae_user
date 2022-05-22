import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/search/search_cubit.dart';
import 'package:uae_user/business_logic/user/sub_category/sub_category_cubit.dart';
import 'package:uae_user/data/requests/search/search_request.dart';

import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../views/products_in_stock_item.dart';
import '../../../widgets/default_text.dart';

class CategoriesScreen extends StatefulWidget {
  final int subCategoryId;
  final String subCategoryName;


  const CategoriesScreen({
    Key? key,
    required this.subCategoryId,
    required this.subCategoryName,

  }) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}
late String tabBarName ;
class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  TextEditingController offersSearchController = TextEditingController();


  List<Tab> tabBarItem = [
    Tab(child: DefaultText(text: tabBarName,),),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SubCategoryCubit()
          ..userSubCategories(subCategoryId: widget.subCategoryId),),
        BlocProvider(create: (context) => SearchCubit()
          ..userSearch(page: 0,),),

      ],
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
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
                      text: AppLocalizations.of(context)!.uaeStores,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Bukra-Regular',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    )),
              ],
            ),
            bottom: TabBar(
                indicatorColor: AppColors.lightBlue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              isScrollable: true,
              tabs:tabBarItem,
            ),
            // bottom: PreferredSize(
            //   preferredSize: const Size.fromHeight(120),
            //   child: Column(
            //     children: [
            //       Container(
            //         color: AppColors.lightBlue,
            //         child: Center(
            //           child: Padding(
            //             padding:const EdgeInsets.symmetric(vertical: 20),
            //             child: SizedBox(
            //                 height: 35,
            //                 width: 300,
            //                 child: CustomeSearchField(
            //                   controller: offersSearchController,
            //                 )),
            //           ),
            //         ),
            //       ),
            //       ColoredBox(
            //         color: Colors.white,
            //         child: TabBar(
            //           labelColor: Colors.white,
            //           tabs: <Widget>[
            //             Tab(
            //               child: DefaultText(
            //                 text: 'text',
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .bodyText1
            //                     ?.copyWith(color: Colors.black),
            //               ),
            //             ),
            //             Tab(
            //               child: DefaultText(text: 'text text text text text text ',
            //                 maxLines: 2,
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .bodyText1
            //                     ?.copyWith(color: Colors.black),
            //               ),
            //             ),
            //             Tab(
            //               child: DefaultText(text: 'text',
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .bodyText1
            //                     ?.copyWith(color: Colors.black),
            //               ),
            //             ),
            //             Tab(
            //               child: DefaultText(text: 'text',
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .bodyText1
            //                     ?.copyWith(color: Colors.black),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
          body: TabBarView(
            children: [
              Column(
              children: [
                // Container(
                //   color: AppColors.lightBlue,
                //   child: Center(
                //     child: Padding(
                //       padding:const EdgeInsets.symmetric(vertical: 20),
                //       child: SizedBox(
                //           height: 35,
                //           width: 300,
                //           child: CustomeSearchField(
                //             controller: offersSearchController,
                //           )),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 12.0,
                      end: 12.0,
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              bottom: 10.0, top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, FILTER_SCREEN_R);
                                },
                                child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 5.0),
                                      child: Image.asset(
                                        'assets/icons/filter.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                    )),
                              ),
                              Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 5.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/menu@3x.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.only(
                                              start: 5.0),
                                          child: DefaultText(
                                            text: AppLocalizations.of(context)!.all,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                ?.copyWith(
                                                    color: AppColors.lightBlue),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    mainAxisExtent: 205),
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductsInStockItem(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ADDING_PRODUCT_TO_CART_SCREEN_R);
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
              Column(
                children: [
                  // Container(
                  //   color: AppColors.lightBlue,
                  //   child: Center(
                  //     child: Padding(
                  //       padding:const EdgeInsets.symmetric(vertical: 20),
                  //       child: SizedBox(
                  //           height: 35,
                  //           width: 300,
                  //           child: CustomeSearchField(
                  //             controller: offersSearchController,
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 12.0,
                        end: 12.0,
                      ),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                bottom: 10.0, top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, FILTER_SCREEN_R);
                                  },
                                  child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 5.0),
                                        child: Image.asset(
                                          'assets/icons/filter.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      )),
                                ),
                                Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 5.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/menu@3x.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.only(
                                                start: 5.0),
                                            child: DefaultText(
                                              text: AppLocalizations.of(context)!.all,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                  color: AppColors.lightBlue),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  mainAxisExtent: 205),
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductsInStockItem(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ADDING_PRODUCT_TO_CART_SCREEN_R);
                                  },
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // Container(
                  //   color: AppColors.lightBlue,
                  //   child: Center(
                  //     child: Padding(
                  //       padding:const EdgeInsets.symmetric(vertical: 20),
                  //       child: SizedBox(
                  //           height: 35,
                  //           width: 300,
                  //           child: CustomeSearchField(
                  //             controller: offersSearchController,
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 12.0,
                        end: 12.0,
                      ),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                bottom: 10.0, top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, FILTER_SCREEN_R);
                                  },
                                  child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 5.0),
                                        child: Image.asset(
                                          'assets/icons/filter.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      )),
                                ),
                                Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 5.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/menu@3x.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.only(
                                                start: 5.0),
                                            child: DefaultText(
                                              text: AppLocalizations.of(context)!.all,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                  color: AppColors.lightBlue),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  mainAxisExtent: 205),
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductsInStockItem(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ADDING_PRODUCT_TO_CART_SCREEN_R);
                                  },
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ]
          ),
        ),
      ),
    );
  }
}
//   ListView(
//   children: [
//     Row(
//       children: [
//         Padding(
//           padding: const EdgeInsetsDirectional.only(
//               start: 15, top: 10, bottom: 25),
//           child: DefaultText(
//             text: widget.subCategoryName,
//             style:
//             Theme.of(context).textTheme.headline6?.copyWith(
//               fontFamily: 'Bukra-Regular',
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     ),
//     BlocBuilder<SubCategoryCubit, SubCategoryState>(
//       builder: (context, state) {
//         if (state is UserSubCategorySuccessState) {
//           return GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate:
//               const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 20,
//                   mainAxisExtent: 150),
//               itemCount: state.userSubCategories.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return HomeGridViewItem(
//                   homeGridViewItemText: state.userSubCategories[index].name,
//                   homeGridViewItemImgageUrl: state.userSubCategories[index].image,
//                   onTap: () {
//                     Navigator.pushNamed(context, PRODUCTS_IN_STOCK_SCREEN_R);
//
//                   },
//                 );
//               });
//         } else if (state is UserSubCategoryLoadingState) {
//           return const DefaultLoadingIndicator();
//         } else {
//           return const DefaultErrorWidget();
//         }
//
//       },
//     ),
//
//   ],
// ),
//   ListView(
//   children: [
//     Row(
//       children: [
//         Padding(
//           padding: const EdgeInsetsDirectional.only(
//               start: 15, top: 10, bottom: 25),
//           child: DefaultText(
//             text: widget.subCategoryName,
//             style:
//             Theme.of(context).textTheme.headline6?.copyWith(
//               fontFamily: 'Bukra-Regular',
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     ),
//     BlocBuilder<SubCategoryCubit, SubCategoryState>(
//       builder: (context, state) {
//         if (state is UserSubCategorySuccessState) {
//           return GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate:
//               const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 20,
//                   mainAxisExtent: 150),
//               itemCount: state.userSubCategories.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return HomeGridViewItem(
//                   homeGridViewItemText: state.userSubCategories[index].name,
//                   homeGridViewItemImgageUrl: state.userSubCategories[index].image,
//                   onTap: () {
//                     Navigator.pushNamed(context, PRODUCTS_IN_STOCK_SCREEN_R);
//
//                   },
//                 );
//               });
//         } else if (state is UserSubCategoryLoadingState) {
//           return const DefaultLoadingIndicator();
//         } else {
//           return const DefaultErrorWidget();
//         }
//
//       },
//     ),
//     // GridView.builder(
//     //     shrinkWrap: true,
//     //     physics: const NeverScrollableScrollPhysics(),
//     //     gridDelegate:
//     //     const SliverGridDelegateWithFixedCrossAxisCount(
//     //         crossAxisCount: 3,
//     //         mainAxisSpacing: 23,
//     //         mainAxisExtent: 150),
//     //     itemCount: 3,
//     //     itemBuilder: (BuildContext context, int index) {
//     //       return HomeGridViewItem(
//     //         homeGridViewItemText: 'Home Grid View Item Text',
//     //         homeGridViewItemImgageUrl: 'assets/images/chocolate.png',
//     //         onTap: () {Navigator.pushNamed(context, PRODUCTS_IN_STOCK_SCREEN_R);},
//     //       );
//     //     }),
//   ],
// ),
