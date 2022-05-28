import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/auth/user_auth_cubit.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/constants/enums.dart';

import '../screens/user_screens/verification/verification_screen.dart';
import '../styles/colors.dart';
import '../widgets/default_material_button.dart';

class LoginBySocialDialog extends StatefulWidget {
  final UserAuthCubit userAuthCubit;
  final String source;

  const LoginBySocialDialog(
      {Key? key, required this.userAuthCubit, required this.source})
      : super(key: key);

  @override
  State<LoginBySocialDialog> createState() => _LoginBySocialDialogState();
}

class _LoginBySocialDialogState extends State<LoginBySocialDialog> {
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();

  CountryCode? _countryCode = CountryCode(name: 'EG', dialCode: '+20');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetPasswordFormKey,
      child: AlertDialog(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          AppLocalizations.of(context)!.forgetPassInstruction,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        content: Padding(
          padding: const EdgeInsetsDirectional.only(top: 5),
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
                return AppLocalizations.of(context)!.emptyPhoneNumber;
              }
            },
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.hintPhone,
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
        actions: [
          BlocConsumer<UserAuthCubit, UserAuthStates>(
            listener: (context, state) {
              if (state is UserResetPasswordErrorState) {
                showToastMsg(
                    msg: AppLocalizations.of(context)!.pleaseTryAgain,
                    toastState: ToastStates.ERROR);
              } else if (state is UserResetPasswordSuccessState) {
                navigatePushReplacement(
                    context, VerificationScreen(phone: phoneController.text));
              }
            },
            builder: (context, state) {
              return DefaultMaterialButton(
                text: AppLocalizations.of(context)!.enter,
                onTap: () {
                  if (resetPasswordFormKey.currentState!.validate()) {
                    if (widget.source == 'facebook') {
                      widget.userAuthCubit.signInWithFacebook(_countryCode!.dialCode! +phoneController.text);
                    } else if (widget.source == 'Google') {
                      widget.userAuthCubit.signInWithGoogle(_countryCode!.dialCode! +phoneController.text);
                    }
                  }
                },
                color: AppColors.darkBlue,
                textColor: AppColors.lightGrey,
                height: 45,
              );
            },
          )
        ],
      ),
    );
  }
}
