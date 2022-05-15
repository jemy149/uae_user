import 'package:flutter/material.dart';

class DefaultMaterialButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final Function() onTap;
  final double? height;
  final double? width;
  final double? fontSize;

  const DefaultMaterialButton({
    Key? key,
    required this.text,
    this.color,
    this.textColor,
    required this.onTap, this.height, this.width, this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize:fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
