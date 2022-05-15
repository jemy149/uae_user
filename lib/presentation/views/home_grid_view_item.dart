import 'package:flutter/material.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class HomeGridViewItem extends StatelessWidget {
  final Function() onTap;
  const HomeGridViewItem({Key? key,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
             child: Image.asset('assets/images/chocolate.png',fit: BoxFit.contain,height: 120,width: 120,),
          ),
          SizedBox(
            width: 120,
            child: DefaultText(text: 'home item item item',
            style: Theme.of(context).textTheme.button?.copyWith(fontSize: 12),),
          )
        ],
      ),
    );
  }
}
