import 'package:flutter/material.dart';
import 'package:uae_user/presentation/styles/colors.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  TextEditingController? controller;
   RoundedTextField({
    Key? key,
     required this.controller,
    required this.hintText,
    this.icon = Icons.check_circle_outline_rounded,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: Container(
            margin:const EdgeInsets.all(25),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
             border: Border.all(
               width: 1
             )
            ),
            child: TextFormField(
              controller: controller,
              expands: true,
              maxLines: null,
              minLines: null,
              onChanged: onChanged,
              cursorColor: AppColors.lightBlue,
              decoration: InputDecoration(
                icon: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    icon,
                    color: AppColors.lightBlue,
                  ),
                ),
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ));
  }
}
