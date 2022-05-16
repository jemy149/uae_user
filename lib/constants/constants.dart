// ignore_for_file: constant_identifier_names, non_constant_identifier_names



import 'package:uae_user/constants/shared_preferences_keys.dart';

import '../data/data_provider/local/cache_helper.dart';

String? AppLang = 'En' ;


///////////////////////////////// sharedPreferences constant /////////////////////////////////////////////
String? apiToken = CacheHelper.getDataFromSP(key: SharedPreferencesKeys.SP_ACCESS_TOKEN_KEY);
String? accessToken;
String? accountType;
String? tmpToken;





















