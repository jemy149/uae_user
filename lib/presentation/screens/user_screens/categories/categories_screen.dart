import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/views/home_offers_card_item.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../views/home_grid_view_item.dart';
import '../../../widgets/custome_search_field.dart';
import '../../../widgets/default_text.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  TextEditingController offersSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
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
                      text: AppLocalizations.of(context)!.offers,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontFamily: 'Bukra-Regular',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: Column(
                children: [
                  Container(
                    color: AppColors.lightBlue,
                    child: Center(
                      child: Padding(
                        padding:const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                            height: 35,
                            width: 300,
                            child: CustomeSearchField(
                              controller: offersSearchController,
                            )),
                      ),
                    ),
                  ),
                  ColoredBox(
                    color: Colors.white,
                    child: TabBar(
                      labelColor: Colors.white,
                      tabs: <Widget>[
                        Tab(
                          child: DefaultText(
                            text: 'text',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: DefaultText(text: 'text',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: DefaultText(text: 'text',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: DefaultText(text: 'text',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 12.0,
                    end: 12.0,
                  ),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 15, top: 10, bottom: 25),
                            child: DefaultText(
                              text: AppLocalizations.of(context)!.categories,
                              style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                fontFamily: 'Bukra-Regular',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 23,
                              mainAxisExtent: 150),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return HomeGridViewItem(
                              onTap: () {Navigator.pushNamed(context, PRODUCTS_IN_STOCK_SCREEN_R);},
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
