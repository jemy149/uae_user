import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/shared/language/language_cubit.dart';
import 'package:uae_user/constants/screens.dart';
import 'package:uae_user/constants/shared_preferences_keys.dart';
import 'package:uae_user/data/data_provider/local/cache_helper.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';

import '../../../../constants/constants.dart';
import '../../../../l10n/l10n.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
late bool isArabic ;

@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final String defaultLocale = Platform.localeName.substring(0,2);
    return SafeArea(
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
                            text: AppLocalizations.of(context)!.language,
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontFamily: 'Bukra-Regular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                            //
                          )),
                    ],
                  ),
                ),
                body: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/language-learning.png')),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 50.0),
                              child: Builder(
                                builder: (context) {
                                  LanguageCubit _langCubit;
                                  _langCubit = LanguageCubit.get(context);
                                  return DefaultMaterialButton(
                                      text: AppLocalizations.of(context)!.detectLanguage,
                                      onTap: () {
                                        if( CacheHelper.getDataFromSP(key: SharedPreferencesKeys.SP_APP_LANGUAGE)=='ar')
                                          {
                                            AppLang="En";
                                            _langCubit.setLocale(const Locale('en'));

                                          }
                                        else if( CacheHelper.getDataFromSP(key: SharedPreferencesKeys.SP_APP_LANGUAGE)=='en')
                                        {
                                          AppLang="Ar";
                                          _langCubit.setLocale(const Locale('ar'));

                                        }



                                      },
                                      height: 50,
                                      width: 220,
                                      color: AppColors.lightBlue,
                                      fontSize: 25,
                                      textColor: Colors.white);
                                }
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
    );
  }
}
