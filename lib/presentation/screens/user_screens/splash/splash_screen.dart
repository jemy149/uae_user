import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import '../../../styles/colors.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashScreenView(
            navigateRoute:  LoginScreen(),
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
