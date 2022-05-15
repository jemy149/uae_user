import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget {
  final String titleText;

  const CustomeAppBar({Key? key,required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('assets/images/bell1.png'),
        onPressed: () {},
      ),
      title: const Text('Loading'),

      actions: [
        IconButton(
          icon: Stack(
            alignment: Alignment.topRight,
            children: [
              const Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              CircleAvatar(
                backgroundColor: Colors.lightGreenAccent,
                radius: 6.0,
                child: Text(
                    titleText
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
