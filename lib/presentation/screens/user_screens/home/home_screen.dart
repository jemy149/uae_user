import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/views/custome_carousel_slider.dart';
import 'package:uae_user/presentation/views/home_grid_view_item.dart';
import 'package:uae_user/presentation/views/home_offers_card_item.dart';
import 'package:uae_user/presentation/widgets/custome_search_field.dart';
import 'package:uae_user/presentation/widgets/default_form_field.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../constants/screens.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.lightBlue,
          leading: IconButton(
            icon: Image.asset('assets/images/bell1.png'),
            onPressed: () {
              Navigator.pushNamed(context, NOTIFICATIONS_SCREEN_R);
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultText(text: AppLocalizations.of(context)!.home),
            ],
          ),
          actions: [
            IconButton(
              icon: Stack(
                alignment: Alignment.topRight,
                children: const [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.lightGreenAccent,
                    radius: 5.0,
                    child: Center(
                      child: Text(
                        '0',
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(context, CART_SCREEN_R);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: AppColors.lightBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    physics:const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultText(
                          text:
                              '${AppLocalizations.of(context)!.welcome} User Name',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: AppColors.lightGrey,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: SizedBox(
                              height: 35,
                              width: 300,
                              child: CustomeSearchField(
                                controller: searchController,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: RawScrollbar(
                thumbColor: AppColors.lightBlue,
                radius: const Radius.circular(20),
                thickness: 7,
                isAlwaysShown: true,
                interactive: true,
                controller: scrollController,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomeCarouselSlider(),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(
                              text: AppLocalizations.of(context)!.offers,
                              style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                fontFamily: 'Bukra-Regular',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: (){Navigator.pushNamed(context, OFFERS_SCREEN_R);},
                              child: DefaultText(
                                text: AppLocalizations.of(context)!.all,
                                style:
                                    Theme.of(context).textTheme.bodyText1?.copyWith(
                                          color: AppColors.lightBlue,
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            HomeOffersCardItem(),
                            HomeOffersCardItem(),
                            HomeOffersCardItem(),
                            HomeOffersCardItem(),
                            HomeOffersCardItem(),
                            HomeOffersCardItem(),
                            HomeOffersCardItem(),
                          ],
                        ),
                      ),
                    ),
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
                                  mainAxisSpacing: 20,
                                  mainAxisExtent: 150),
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return HomeGridViewItem(
                              onTap: () {Navigator.pushNamed(context, CATEGORIES_SCREEN_R);},
                            );
                          }),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
