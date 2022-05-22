import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/views/products_in_stock_item.dart';

import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/custome_search_field.dart';
import '../../../widgets/default_text.dart';

class ProdrctsInStockScreen extends StatelessWidget {
  ProdrctsInStockScreen({Key? key}) : super(key: key);
  TextEditingController offersSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
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
                      text: AppLocalizations.of(context)!.uaeStores,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Bukra-Regular',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    )),
              ],
            ),
          ),
          body: Column(
            children: [
              Container(
                color: AppColors.lightBlue,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                        height: 35,
                        width: 300,
                        child: CustomeSearchField(
                          controller: offersSearchController,
                        )),
                  ),
                ),
              ),
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
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 5.0),
                                        child: DefaultText(
                                          text:
                                              AppLocalizations.of(context)!.all,
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
                              onTapCart: (){},
                              itemName: 'item name',
                              imageUrl: 'assets/images/fruits.png',
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
        ));
  }
}
