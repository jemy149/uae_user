import 'package:flutter/material.dart';

class DefaultProfileListTile extends StatelessWidget {
  final String image;
  final String? titleText;
  final Color? iconColor;
   Function() onTap;
 DefaultProfileListTile({Key? key,required this.image,required this.titleText, this.iconColor,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10.0),
      child: Container(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: ListTile(
            leading: Image.asset(image,height: 30,color: iconColor,),
            title: Text(titleText!),
            trailing:const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
