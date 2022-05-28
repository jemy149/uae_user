import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_user/business_logic/shared/language/language_cubit.dart';
import 'package:uae_user/presentation/router/app_router.dart';
import 'package:uae_user/presentation/styles/themes.dart';
import 'business_logic/user/add_to_cart/add_to_cart_cubit.dart';
import 'business_logic/user/ads/ads_cubit.dart';
import 'business_logic/user/cart/edit_cart/edit_cart_cubit.dart';
import 'business_logic/user/category/category_cubit.dart';
import 'business_logic/user/change_favorite/favorite_change_cubit.dart';
import 'business_logic/user/get_offers/get_offers_cubit.dart';
import 'data/data_provider/local/cache_helper.dart';
import 'data/data_provider/remote/dio_helper.dart';
import 'l10n/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  MyApp({
    Key? key,
  }) : super(
          key: key,
        );

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeFavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => EditCartCubit(),
        ),
        BlocProvider(
          create: (context) => GetOffersCubit()..userGetOffers(),
        ),
        BlocProvider(create: (context) => AddToCartCubit()),
        BlocProvider(
          create: (context) => AdsCubit()..userAds(type: 'welcome'),
        ),
        BlocProvider(
          create: (context) => CategoryCubit()..userCategories(),
        ),

      ],
      child: BlocBuilder<LanguageCubit,LanguageState>(builder: (context,state) {
        LanguageCubit _langCubit;
        _langCubit = LanguageCubit.get(context);

        return Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            useInheritedMediaQuery: true,
            supportedLocales: L10n.all,
            locale: _langCubit.getLocale,
            // locale: Locale(CacheHelper.getCurrentLanguage()),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            onGenerateRoute: appRouter.onGenerateRoute,
          ),
        );
      }),
    );
  }
}
