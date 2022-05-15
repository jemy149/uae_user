import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:uae_user/presentation/screens/user_screens/favourites/favourites_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/orders/orders_screen.dart';
import '../../../styles/colors.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
   PageController _pageController = PageController();



  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<BottomNavyBarItem> bottomNavBarItems = [
      _bottomNavyBarItem(
          context: context,
          title: AppLocalizations.of(context)!.home,
          imgPath: 'assets/images/home-icon.png'),
      _bottomNavyBarItem(
          context: context,
          title: AppLocalizations.of(context)!.myOrders,
          imgPath: 'assets/images/list-icon.png'),
      _bottomNavyBarItem(
          context: context,
          title: AppLocalizations.of(context)!.fav,
          imgPath: 'assets/images/love-icon.png'),
      _bottomNavyBarItem(
          context: context,
          title: AppLocalizations.of(context)!.profile,
          imgPath: 'assets/images/user-icon.png'),
    ];
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: screens,
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          showElevation: true,
          selectedIndex:_currentIndex,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.jumpToPage(
              index
            );
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          items: bottomNavBarItems,
        ),
      ),
    );
  }
}

List<Widget> screens = [
  HomeScreen(),
  OrdersScreen(),
  FavouritesScreen(),
  ProfileScreen(),
];


BottomNavyBarItem _bottomNavyBarItem({
  required BuildContext context,
  required String imgPath,
  required String title,
}) {
  return BottomNavyBarItem(
    icon: Image.asset(imgPath),
    title: Text(
      title,
      style: Theme.of(context).textTheme.subtitle1,
    ),
    activeColor: AppColors.skyBlue,
    inactiveColor: AppColors.grey,
  );
}
