import 'package:flutter/material.dart';
import '../../constants/screens.dart';
import '../styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomeSearchField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CustomeSearchField({Key? key,required this.controller, required this.keyboardType, this.onFieldSubmitted, this.onEditingComplete, this.onChanged, this.validator, this.prefixIcon, this.suffixIcon}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: TextInputAction.search,
      cursorColor: AppColors.lightBlue,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.search,
        hintStyle: const TextStyle(fontFamily: 'Bukra-Regular', height: 0.5),
        hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
        ),
      ),
    );
  }
}
