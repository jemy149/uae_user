
import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/constants/shared_preferences_keys.dart';

import '../../../constants/constants.dart';
import '../../../data/data_provider/local/cache_helper.dart';
import '../../../l10n/l10n.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  static LanguageCubit get(context) => BlocProvider.of(context);


  Locale? localeVar = Locale(CacheHelper.getCurrentLanguage());
  Locale get getLocale {
    if( CacheHelper.getDataFromSP(key: SharedPreferencesKeys.SP_APP_LANGUAGE)=='ar')
    {
      AppLang="Ar";
    }
    else if( CacheHelper.getDataFromSP(key: SharedPreferencesKeys.SP_APP_LANGUAGE)=='en')
    {
      AppLang="En";
    }
    return localeVar!;

  }

   void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    localeVar = locale;
    CacheHelper.saveDataToSP(key: SharedPreferencesKeys.SP_APP_LANGUAGE, value: localeVar.toString());
    emit(LanguageSetLocale());
  }

  void clearLocale(){
     localeVar = null;
     emit(LanguageClearLocale());
  }
}
