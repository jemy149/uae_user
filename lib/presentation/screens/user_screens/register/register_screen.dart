import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/auth/user_auth_cubit.dart';
import 'package:uae_user/presentation/screens/user_screens/verification/verification_screen.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/views/animated_image.dart';
import 'package:uae_user/presentation/widgets/default_form_field.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/enums.dart';
import '../../../../constants/screens.dart';
import '../../../../constants/shared_preferences_keys.dart';
import '../../../../data/data_provider/local/cache_helper.dart';
import '../../../widgets/outlined_social_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late UserAuthCubit userAuthCubit;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController =
      TextEditingController();

  CountryCode? _countryCode = CountryCode(name: 'EG', dialCode: '+20');

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => UserAuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              children: [
                const AnimatedImage(),
                Form(
                  key: registerFormKey,
                  child: Builder(builder: (context) {
                    userAuthCubit = UserAuthCubit.get(context);
                    return BlocConsumer<UserAuthCubit, UserAuthStates>(
                      listener: (context, state) {
                        printTest(state.toString());
                        // if (state is UserRegisterBySocialTokenSuccessState) {
                        //   Navigator.pushNamedAndRemoveUntil(
                        //       context, HOME_LAYOUT_R, (route) => false);
                        // }
                        // if (state is UserRegisterBySocialTokenErrorState) {
                        //   showToastMsg(
                        //       msg: state.message ??
                        //           AppLocalizations.of(context)!.pleaseTryAgain,
                        //       toastState: ToastStates.ERROR);
                        // }
                        if (state is UserRegisterErrorState) {
                          showToastMsg(
                              msg: state.message ??
                                  AppLocalizations.of(context)!.pleaseTryAgain,
                              toastState: ToastStates.ERROR);
                        }
                        if (state is UserRegisterSuccessState) {
                          navigatePushReplacement(context,
                              VerificationScreen(phone: phoneController.text));
                        }
                        // if (state is UserSocialAuthSuccessState) {
                        //   if (phoneController.text.isNotEmpty) {
                        //     userAuthCubit.userRegisterBySocialToken(
                        //         socialToken: state.socialToken,
                        //         email: state.email,
                        //         phone: _countryCode!.dialCode! +
                        //             phoneController.text,
                        //         name: state.name ?? nameController.text,
                        //         image: state.urlImage ?? '');
                        //   } else {
                        //     showToastMsg(
                        //         msg: AppLocalizations.of(context)!
                        //             .enterYourPhone,
                        //         toastState: ToastStates.ERROR);
                        //   }
                        // }
                        // if (state is UserSocialAuthErrorState) {
                        //   showToastMsg(
                        //       msg: AppLocalizations.of(context)!.enterYourPhone,
                        //       toastState: ToastStates.ERROR);
                        // }

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
                                    text:
                                        AppLocalizations.of(context)!.register,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 5),
                                    child: DefaultFormField(
                                      controller: nameController,
                                      imgPath: 'assets/images/email.png',
                                      hintText: AppLocalizations.of(context)!
                                          .hintFullName,
                                      keyboardType: TextInputType.text,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return AppLocalizations.of(context)!
                                              .enterYourName;
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 5),
                                    child: DefaultFormField(
                                      controller: emailController,
                                      imgPath: 'assets/images/email.png',
                                      hintText: AppLocalizations.of(context)!
                                          .hintEmail,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return AppLocalizations.of(context)!
                                              .enterYourEmail;
                                        }
                                      },
                                    ),
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
                                              .enterYourPhone;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: const Icon(Icons.check),
                                        prefixIcon: CountryCodePicker(
                                          onChanged: (countryCode) {
                                            _countryCode = countryCode;
                                          },
                                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                          initialSelection: 'eg',
                                          favorite: ['+20', 'EG'],
                                          // optional. Shows only country name and flag
                                          showCountryOnly: false,
                                          // optional. Shows only country name and flag when popup is closed.
                                          showOnlyCountryWhenClosed: false,
                                          // optional. aligns the flag and the Text left
                                          alignLeft: false,
                                          countryFilter: ['+20', '+971'],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 5),
                                    child: DefaultFormField(
                                      controller: passwordController,
                                      imgPath: 'assets/images/padlock.png',
                                      hintText: AppLocalizations.of(context)!
                                          .hintPassword,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return AppLocalizations.of(context)!
                                              .enterYourPassword;
                                        } else if (text !=
                                            passwordConfirmationController
                                                .text) {
                                          return AppLocalizations.of(context)!
                                              .enterYourPassword;
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 5),
                                    child: DefaultFormField(
                                      controller:
                                          passwordConfirmationController,
                                      imgPath: 'assets/images/padlock.png',
                                      hintText: AppLocalizations.of(context)!
                                          .confirmPassword,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return AppLocalizations.of(context)!
                                              .enterYourPassword;
                                        } else if (text !=
                                            passwordConfirmationController
                                                .text) {
                                          return AppLocalizations.of(context)!
                                              .enterYourPassword;
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        DefaultMaterialButton(
                                          text: AppLocalizations.of(context)!
                                              .btnRegister,
                                          onTap: () {
                                            if (registerFormKey.currentState!
                                                .validate()) {
                                              userAuthCubit.userRegister(
                                                name: nameController.text,
                                                phone: _countryCode!.dialCode! +
                                                    phoneController.text,
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              );
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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     OutlinedSocialButton(
                            //       text: 'facebook',
                            //       onTap: () async {
                            //         await UserAuthCubit?.get(context)
                            //             .signInWithFacebook();
                            //         socialToken =
                            //             await CacheHelper.getDataFromSP(
                            //                 key: SharedPreferencesKeys
                            //                     .SP_FACEBOOK_ACCESS_TOKEN_KEY);
                            //       },
                            //       image: 'assets/icons/facebook.png',
                            //       textColor: AppColors.darkBlue,
                            //       color: Colors.white,
                            //     ),
                            //     const SizedBox(
                            //       width: 10,
                            //     ),
                            //     OutlinedSocialButton(
                            //       text: 'Google',
                            //       onTap: () async {
                            //         UserAuthCubit?.get(context)
                            //             .signInWithGoogle();
                            //         socialToken =
                            //             await CacheHelper.getDataFromSP(
                            //                 key: SharedPreferencesKeys
                            //                     .SP_GOOGLE_ACCESS_TOKEN_KEY);
                            //       },
                            //       image: 'assets/icons/google.png',
                            //       textColor: AppColors.red,
                            //       color: Colors.white,
                            //     ),
                            //   ],
                            // )
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
      ),
    ));
  }
}
