import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final Function() onTap;
  const DefaultTextButton({Key? key,required this.text, this.color, this.fontSize,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          decoration: TextDecoration.underline
      ),),
    );
  }
}
