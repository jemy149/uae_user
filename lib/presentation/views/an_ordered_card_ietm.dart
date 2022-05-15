import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class AnOrderedCardItem extends StatelessWidget {
  const AnOrderedCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(child: Image.asset('assets/images/chocolate.png',height: 60,width: 60,)),
            const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 5),
                  child: DefaultText(text: 'item name item name item name',
                  maxLines: 10,
                  ),
                )),
            Flexible(child:  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: AppColors.grey,
                ),
              ),
              child:  Padding(
                padding:const EdgeInsets.all(1.0),
                child: DefaultText(text: '${500}',style: Theme.of(context).textTheme.caption?.copyWith(color: AppColors.grey),),
              ),
            ),),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: DefaultText(text: '${6.95} AED',style: Theme.of(context).textTheme.caption?.copyWith(color: AppColors.green,),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
