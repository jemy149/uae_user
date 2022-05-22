import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DefaultFormField extends StatelessWidget {

  final TextEditingController controller;
  final String imgPath;
  final String hintText;
  final TextInputType? keyboardType;
  final double? suffixIconHeight;
  final String? Function(String?)? validator;

   const DefaultFormField({
    Key? key,
    required this.controller,
    required this.imgPath,
    required this.hintText,
    this.keyboardType, this.suffixIconHeight,
    this.validator,
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
      cursorColor: AppColors.lightBlue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        suffixIcon: Image.asset(
          imgPath, height: suffixIconHeight, width: suffixIconHeight,),
      ),
    );
  }
}
