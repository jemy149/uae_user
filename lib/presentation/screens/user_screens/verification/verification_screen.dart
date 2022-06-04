import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/auth/user_auth_cubit.dart';
import 'package:uae_user/presentation/views/animated_image.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/enums.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_form_field.dart';
import '../../../widgets/default_material_button.dart';
import '../../../widgets/default_text.dart';
import '../app_layout/home_layout.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key, this.phone}) : super(key: key);

  TextEditingController verificationCodeController = TextEditingController();
  final String? phone;

  @override
  Widget build(BuildContext context) {
    UserAuthCubit cubit;
    return BlocProvider(
      create: (context) => UserAuthCubit(),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              children: [
                const AnimatedImage(),
                Column(
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
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 20, end: 20, top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: DefaultText(
                                      text: AppLocalizations.of(context)!.welcome,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: DefaultText(
                                      text: AppLocalizations.of(context)!.appName,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: DefaultText(
                                      text: AppLocalizations.of(context)!
                                          .pleaseEnterVerificationCode,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 20),
                            child: DefaultFormField(
                              controller: verificationCodeController,
                              suffixIcon: const Icon(Icons.lock_outline_rounded,color: AppColors.grey,),
                              hintText: AppLocalizations.of(context)!.verificationCode,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Builder(
                                  builder: (context) {
                                    cubit = UserAuthCubit.get(context);
                                    return BlocConsumer<UserAuthCubit, UserAuthStates>(
                                      listener: (context, state) {
                                        if (state is UserValidateCodeErrorState) {
                                          showToastMsg(
                                              msg: state.message ?? AppLocalizations.of(context)!.pleaseTryAgain,
                                              toastState: ToastStates.ERROR);
                                        }
                                        else if(state is UserValidateCodeSuccessState){
                                          Navigator.pushNamedAndRemoveUntil(
                                              context, HOME_LAYOUT_R, (route) => false);
                                        }
                                      },
                                      builder: (context, state) {
                                        return DefaultMaterialButton(
                                          text: AppLocalizations.of(context)!
                                              .confirm,
                                          onTap: () {
                                           String value = verificationCodeController.text;
                                           if(value.isEmpty || value.length !=4){
                                            showToastMsg(msg:  AppLocalizations.of(context)!
                                                .pleaseEnterVerificationCode, toastState: ToastStates.ERROR);
                                           } else if (value.length == 4){
                                             cubit.userValidateCode(phone: phone.toString(), code: verificationCodeController.text);
                                           }
                                          },
                                          height: 50,
                                          width: 150,
                                          color: AppColors.darkBlue,
                                          textColor: Colors.white,
                                        );
                                      },
                                    );
                                  }
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
