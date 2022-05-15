import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uae_user/business_logic/shared/language/language_cubit.dart';
import 'package:uae_user/presentation/router/app_router.dart';
import 'package:uae_user/presentation/styles/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uae_user/presentation/router/app_router.dart';
import 'package:uae_user/presentation/styles/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
  MyApp({Key? key,}) : super(key: key,);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit(),)
      ],
      child: Builder(
          builder: (context) {
            LanguageCubit _langCubit;
            _langCubit = LanguageCubit.get(context);
            return MaterialApp(
              useInheritedMediaQuery: true,
              supportedLocales: L10n.all,
              locale: _langCubit.locale,
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

            );
          }
      ),
    );
  }
}

