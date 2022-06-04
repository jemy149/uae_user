import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DefaultFormField extends StatelessWidget {

  final TextEditingController controller;
  final Widget? suffixIcon;
  final String hintText;
  final TextInputType? keyboardType;
  final double? suffixIconHeight;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Function(String?)? onSaved;

   const DefaultFormField({
    Key? key,
    required this.controller,
    required this.suffixIcon,
    required this.hintText,
    this.keyboardType, this.suffixIconHeight,
    this.validator, this.obscureText = false, this.prefixIcon, this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator,
      textAlign: TextAlign.end,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      style: const TextStyle(
        fontFamily: 'Bukra-Regular',
        color: AppColors.black,
        fontSize: 18,
      ),
      obscureText: obscureText!,
      cursorColor: AppColors.lightBlue,
      onSaved: onSaved,
      decoration: InputDecoration(

        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
