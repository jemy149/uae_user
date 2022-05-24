import 'package:flutter/material.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class HomeGridViewItem extends StatelessWidget {
  final Function() onTap;
  final String homeGridViewItemText;
  final String homeGridViewItemImgageUrl;
  const HomeGridViewItem({Key? key,required this.onTap,required this.homeGridViewItemText,required this.homeGridViewItemImgageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
             child: homeGridViewItemImgageUrl != ''  ?
             Image.network(homeGridViewItemImgageUrl,fit: BoxFit.contain,height: 120,width: 120,) : Image.asset('assets/images/no_image.png',height: 120,width: 120,),
          ),
          SizedBox(
            width: 120,
            child: DefaultText(text: homeGridViewItemText,
            style: Theme.of(context).textTheme.button?.copyWith(fontSize: 12),),
          )
        ],
      ),
    );
  }
}
