import 'package:flutter/material.dart';

class OutlinedSocialButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color textColor;
  final Function() onTap;
  final double? height;
  final double? width;
  final String image;

  const OutlinedSocialButton({
    Key? key,
    required this.text,
    this.color,
    required this.textColor,
    required this.onTap,
    this.height,
    this.width,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
          color: textColor,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20, child: Image.asset(image)),
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
