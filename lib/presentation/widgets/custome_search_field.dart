import 'package:flutter/material.dart';
import '../../constants/screens.dart';
import '../styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomeSearchField extends StatelessWidget {
  const CustomeSearchField({Key? key,required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      onSubmitted: (searchText){},
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
        prefixIcon: IconButton(
          icon: Image.asset('assets/images/search.png'),
          onPressed: () {Navigator.pushNamed(context, SEARCH_SCREEN_R);},
        ),
        suffixIcon: IconButton(
          icon: Image.asset('assets/images/barcode.png'),
          onPressed: () {Navigator.pushNamed(context, QR_CODE_SCREEN_R);},
        ),
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
