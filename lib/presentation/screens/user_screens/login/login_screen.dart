import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uae_user/business_logic/user/auth/user_auth_cubit.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/constants/enums.dart';
import 'package:uae_user/constants/screens.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/views/animated_image.dart';
import 'package:uae_user/presentation/views/correcting_password_alert_dialog.dart';
import 'package:uae_user/presentation/views/login_by_social_dialog.dart';
import 'package:uae_user/presentation/widgets/default_form_field.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:uae_user/presentation/widgets/default_text_button.dart';
import 'package:uae_user/presentation/widgets/outlined_social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late UserAuthCubit userAuthCubit;

  CountryCode? _countryCode = CountryCode(name: 'EG', dialCode: '+20');
  bool _obscureText = true;

    String? _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            children: [
              const AnimatedImage(),
              Form(
                key: loginFormKey,
                child: Builder(builder: (context) {
                  userAuthCubit = UserAuthCubit.get(context);
                  return BlocConsumer<UserAuthCubit, UserAuthStates>(
                    listener: (context, state) {
                      if (state is UserLoginErrorState) {
                        showToastMsg(
                            msg: state.message ??
                                AppLocalizations.of(context)!.pleaseTryAgain,
                            toastState: ToastStates.ERROR);
                      }
                      if (state is UserLoginSuccessState) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HOME_LAYOUT_R,
                          (route) => false,
                        );
                        showToastMsg(
                            msg: state.message ??
                                AppLocalizations.of(context)!.pleaseTryAgain,
                            toastState: ToastStates.SUCCESS);
                      }
                      if (state is UserSocialAuthSuccessState) {
                        userAuthCubit.userSocialLogin(
                            socialToken: state.socialToken,
                            name: state.name,
                            email: state.email,
                            image: null,
                            phone:state.phone );
                      }
                      if (state is UserSocialLoginSuccessState) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, HOME_LAYOUT_R, (route) => false);
                      }
                      if (state is UserSocialLoginErrorState) {
                        showToastMsg(
                            msg: state.message ??
                                AppLocalizations.of(context)!.pleaseTryAgain,
                            toastState: ToastStates.ERROR);
                      } else if (state is UserSocialAuthErrorState) {
                        printTest(FacebookLoginStatus.error.toString());
                        printTest(GoogleSignIn.kSignInFailedError);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/whiteLogo.png',
                                    height: 150,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.welcome,
                                    style: const TextStyle(
                                        color: AppColors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                DefaultText(
                                  text: AppLocalizations.of(context)!.login,
                                  style:
                                      Theme.of(context).textTheme.headline6,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 5),
                                  child: TextFormField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontFamily: 'Bukra-Regular',
                                      color: AppColors.black,
                                      fontSize: 12,
                                    ),
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return AppLocalizations.of(context)!
                                            .emptyPhoneNumber;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: const Icon(Icons.check),
                                      prefixIcon: CountryCodePicker(
                                        onChanged: (countryCode) {
                                          _countryCode = countryCode;
                                        },
                                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                        initialSelection: 'EG',
                                        favorite: const ['+20', 'EG'],
                                        // optional. Shows only country name and flag
                                        showCountryOnly: false,
                                        // optional. Shows only country name and flag when popup is closed.
                                        showOnlyCountryWhenClosed: false,
                                        // optional. aligns the flag and the Text left
                                        alignLeft: false,
                                        countryFilter: const ['+20', '+971'],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 5),
                                  child: DefaultFormField(
                                    onSaved: (val) => _password = val,
                                    obscureText: _obscureText,
                                    prefixIcon:
                                        IconButton(
                                          icon: Icon(_obscureText? Icons.visibility : Icons.visibility_off,color: AppColors.grey,),
                                        onPressed: _toggle
                                          ,),
                                    controller: passwordController,
                                    suffixIcon: const Icon(Icons.lock_outline_rounded,color: AppColors.grey,),
                                    hintText: AppLocalizations.of(context)!
                                        .hintPassword,
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return AppLocalizations.of(context)!
                                            .emptyPhonePassword;
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 15.0,bottom: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      DefaultMaterialButton(
                                        text: AppLocalizations.of(context)!
                                            .login,
                                        onTap: () {
                                          if (loginFormKey.currentState!
                                              .validate()) {
                                            userAuthCubit.userLogin(
                                                phone:
                                                    _countryCode!.dialCode! +
                                                        phoneController.text,
                                                password:
                                                    passwordController.text);
                                          }
                                        },
                                        height: 50,
                                        width: 200,
                                        color: AppColors.darkBlue,
                                        textColor: Colors.white,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedSocialButton(
                                text: 'facebook',
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) =>
                                          LoginBySocialDialog(
                                            userAuthCubit: userAuthCubit,
                                            source: 'facebook',
                                          ));
                                },
                                image: 'assets/icons/facebook.png',
                                textColor: AppColors.darkBlue,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              OutlinedSocialButton(
                                text: 'Google',
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) =>
                                          LoginBySocialDialog(
                                            userAuthCubit: userAuthCubit,
                                            source: 'Google',
                                          ));
                                },
                                image: 'assets/icons/google.png',
                                textColor: AppColors.red,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: DefaultTextButton(
                                      text: AppLocalizations.of(context)!
                                          .forgetPassword,
                                      onTap: () => showDialog(
                                            context: context,
                                            builder: (context) =>
                                                CorrectingPasswordAlertDialog(),
                                          ),
                                      maxLines: 1,
                                      fontSize: 12),
                                ),
                                DefaultTextButton(
                                    text: AppLocalizations.of(context)!
                                        .signUp,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, REGISTER_SCREEN_R);
                                    },
                                    fontSize: 12,
                                    maxLines: 1),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                }),
              ),
            ],

          ),
        ),
      ),
    ));
  }
}
