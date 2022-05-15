

import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextAlign? textAlign;
  const DefaultText({
    Key? key,
    required this.text,
    this.maxLines,
    this.textStyle,
    this.textDirection, this.style, this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textDirection: textDirection,
      style: style,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
