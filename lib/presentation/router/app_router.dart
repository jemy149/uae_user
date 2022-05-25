import 'package:flutter/material.dart';
import 'package:uae_user/constants/screens.dart';
import 'package:uae_user/data/models/user_models/get_orders/get_orders_model.dart';
import 'package:uae_user/presentation/router/arguments/user_arguments/store_sub_category_args.dart';
import 'package:uae_user/presentation/screens/user_screens/about/about_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/adding_additional_location/adding_additional_location_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/adding_product_to_cart/adding_product_to_cart_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/app_layout/home_layout.dart';
import 'package:uae_user/presentation/screens/user_screens/cart/cart_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/categories/categories_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/delivery_details/delivery_details_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/delivery_location/delivery_location_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/favourites/favourites_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/filter/filter_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/language/language_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/notifications/notifications_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/offers/offers_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/orders/orders_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/payment_method/payment_method_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/policy_and_terms/policy_and_terms_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/search/search_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/splash/splash_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/tracking_order/tracking_order_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/user_addresses/user_addresses_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/verification/verification_screen.dart';
import 'package:uae_user/presentation/screens/user_screens/wallet/wallet_screen.dart';

import '../../business_logic/user/my_addresses/my_addresses_cubit.dart';
import '../screens/user_screens/barcode/barcode_screen.dart';
import '../screens/user_screens/delivery_information/delivery_information_screen.dart';
import '../screens/user_screens/frequently_asked_questions/frequently_asked_questions_screen.dart';
import '../screens/user_screens/login/login_screen.dart';
import '../screens/user_screens/products_in_stock/products_in_stock_screen.dart';
import '../screens/user_screens/profile/profile_screen.dart';
import '../screens/user_screens/register/register_screen.dart';

class AppRouter {
  late Widget startWidget;

  AppRouter() {
    startWidget = const SplashScreen();
  }

  // AppRouter() {
  //   accessToken = CacheHelper.getDataFromSP(key: endpoints.SP_ACCESS_TOKEN_KEY);
  //   accountType = CacheHelper.getDataFromSP(key: endpoints.SP_ACCOUNT_TYPE_KEY);
  //   bool locationPicked = CacheHelper.getDataFromSP(
  //           key: endpoints.SP_FIRST_TIME_LOCATION_PICKED) ??
  //       false;
  //
  //   if (accessToken != null) {
  //     if (accountType == 'users') {
  //       if (locationPicked) {
  //         startWidget = const UserShopLayout();
  //       } else {
  //         startWidget = const FirstTimeLocationPicker();
  //       }
  //     } else if (accountType == 'drivers') {
  //       startWidget = const DeliveryRepresentativeShopLayout();
  //     } else if (accountType == 'providers') {
  //       startWidget = const MarketOwnerShopLayout();
  //     }
  //   } else {
  //     startWidget = const ChooseAccount();
  //   }
  // }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startWidget);
      case REGISTER_SCREEN_R:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case LOGIN_SCREEN_R:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case VERIFICATION_SCREEN_R:
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case HOME_LAYOUT_R:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case PROFILE_SCREEN_R:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case ORDERS_SCREEN_R:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());
      case FAVOURITES_SCREEN_R:
        return MaterialPageRoute(builder: (_) => const FavouritesScreen());
      case TRACKING_ORDER_SCREEN_R:
        return MaterialPageRoute(builder: (_) =>  TrackingOrderScreen());
      case ABOUT_SCREEN_R:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      case FREQUENTLY_ASKED_QUESTIONS_SCREEN_R:
        return MaterialPageRoute(
            builder: (_) => const FrequentlyAskedQuestionsScreen());
      case POLICY_AND_TERMS_SCREEN_R:
        return MaterialPageRoute(builder: (_) => const PolicyAndTermsScreen());
      case LANGUAGE_SCREEN_R:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case NOTIFICATIONS_SCREEN_R:
        return MaterialPageRoute(builder: (_) =>  NotificationsScreen());
      case DELIVERY_INFORMATION_SCREEN_R:
        final GetOrdersModel getOrdersModel = settings.arguments as GetOrdersModel;
        return MaterialPageRoute(
            builder: (_) =>  DeliveryInformationScreen(getOrdersModel:getOrdersModel));
      case CART_SCREEN_R:
        return MaterialPageRoute(builder: (_) =>  CartScreen());
      case OFFERS_SCREEN_R:
        return MaterialPageRoute(builder: (_) => OffersScreen());
      case FILTER_SCREEN_R:
        final int subCategoryId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => FilterScreen(subCategoryId:subCategoryId));
      case WALLET_SCREEN_R:
        return MaterialPageRoute(builder: (_) => WalletScreen());
      case CATEGORIES_SCREEN_R:
        final int subCategoryId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => CategoriesScreen(mainCategoryId: subCategoryId,));
      case PRODUCTS_IN_STOCK_SCREEN_R:
        return MaterialPageRoute(builder: (_) => ProdrctsInStockScreen());
      case ADDING_PRODUCT_TO_CART_SCREEN_R:
        final int productId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) =>  AddingProductToCartScreen(productId: 10123,));
      case DELIVERY_LOCATION_SCREEN_R:
        return MaterialPageRoute(builder: (_) => const DeliveryLocationScreen());
      case PAYMENT_METHOD_SCREEN_R:
        return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());
      case BAR_CODE_SCREEN_R:
        return MaterialPageRoute(builder: (_) => const BarCodeScreen());
      case DELIVERY_DETAILS_SCREEN_R:
        return MaterialPageRoute(builder: (_) => DeliveryDetailsScreen());
      case USER_ADDRESSES_SCREEN_R:
        return MaterialPageRoute(builder: (_) => const UserAddressesScreen());
      case ADDING_ADDITIONAL_LOCATION_SCREEN_R:
        final MyAddressesCubit _myAddressesCubit=settings.arguments as MyAddressesCubit;
        return MaterialPageRoute(
            builder: (_) =>  AddingAdditionalLocationScreen(myAddressesCubit: _myAddressesCubit,));
      case SEARCH_SCREEN_R:
        return MaterialPageRoute(builder: (_) => SearchScreen());

      default:
        return null;
    }
  }
}
