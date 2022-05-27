import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/auth/user_auth_cubit.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/constants/constants.dart';
import 'package:uae_user/constants/shared_preferences_keys.dart';
import 'package:uae_user/data/data_provider/local/cache_helper.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/views/default_profile_list_tile.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

import '../../../../constants/screens.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('profile'),
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 170,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DefaultText(
                    text: AppLocalizations.of(context)!.welcome,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: AppColors.lightBlue),
                  ),
                  Image.asset(
                    'assets/images/blueLogo.png',
                    height: 160,
                  )
                ],
              ),
            ),
            DefaultProfileListTile(
              onTap: () {
                Navigator.pushNamed(context, USER_ADDRESSES_SCREEN_R);
              },
              image: 'assets/images/place2.png',
              titleText: 'Current Address',
              iconColor: AppColors.lightBlue,
            ),
            DefaultProfileListTile(
              onTap: () {
                Navigator.pushNamed(context, WALLET_SCREEN_R);
              },
              image: 'assets/icons/wallet.jpg',
              titleText: AppLocalizations.of(context)!.wallet,
            ),
            DefaultProfileListTile(
              onTap: () {
                Navigator.pushNamed(context, ABOUT_SCREEN_R);
              },
              image: 'assets/images/info-button.png',
              titleText: AppLocalizations.of(context)!.titleAbout,
            ),
            DefaultProfileListTile(
              onTap: () {
                Navigator.pushNamed(
                    context, FREQUENTLY_ASKED_QUESTIONS_SCREEN_R);
              },
              image: 'assets/images/question.png',
              titleText: AppLocalizations.of(context)!.titleHelp,
            ),
            DefaultProfileListTile(
              onTap: () {
                Navigator.pushNamed(context, POLICY_AND_TERMS_SCREEN_R);
              },
              image: 'assets/images/terms-and-conditions.png',
              titleText: '${AppLocalizations.of(context)!.policyAndTerms}',
            ),
            DefaultProfileListTile(
              onTap: () {
                Navigator.pushNamed(context, LANGUAGE_SCREEN_R);
              },
              image: 'assets/images/world.png',
              titleText: AppLocalizations.of(context)!.language,
            ),
            BlocProvider(
              create: (context) => UserAuthCubit(),
              child: BlocConsumer<UserAuthCubit, UserAuthStates>(
                listener: (context, state) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LOGIN_SCREEN_R, (route) => false);
                },
                builder: (context, state) {
                  return DefaultProfileListTile(
                    onTap: () async{
                      UserAuthCubit.get(context).userLogout();
                      UserAuthCubit.get(context).signOut();
                     await CacheHelper.sharedPreferences.clear();
                      apiToken =  CacheHelper.getDataFromSP(
                          key: SharedPreferencesKeys.SP_API_TOKEN_KEY);
                      printTest('>>>>>>>>>>>>>>>>>>>>>>>>>>>>> apiToken ${apiToken!}');
                    },
                    image: 'assets/icons/logout.jpg',
                    titleText: AppLocalizations.of(context)!.logout,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
