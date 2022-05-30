import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:uae_user/constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/shared_preferences_keys.dart';
import '../../../../data/data_provider/local/cache_helper.dart';
import '../../../styles/colors.dart';
import '../app_layout/home_layout.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    apiToken =  CacheHelper.getDataFromSP(
        key: SharedPreferencesKeys.SP_API_TOKEN_KEY).toString();
    printTest('test apiToken '+apiToken.toString());
    return Scaffold(
      body: Stack(
        children: [
          SplashScreenView(
            navigateRoute: SizedBox(
              child: apiToken == 'null'
                  ? const LoginScreen()
                  : const HomeLayout(),
            ),
            duration: 4000,
            imageSize: 150,
            imageSrc: 'assets/images/whiteLogo.png',
            backgroundColor: AppColors.lightBlue,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/cool-shapes-up.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/cool-shapes-down.png'),
          ),
        ],
      ),
    );
  }
}
