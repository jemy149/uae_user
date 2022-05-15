import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import '../widgets/default_text.dart';

class FilterListTileItem extends StatelessWidget {
  const FilterListTileItem({Key? key,required this.text,required this.isColorTrue,required this.onTap}) : super(key: key);
  final String text;
  final bool isColorTrue;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 3),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color:isColorTrue? AppColors.lightBlue2:AppColors.lightBlue,
            border: Border.all(
              width: 1,
              color: Colors.white
            ),
            borderRadius: BorderRadius.circular(15)
          ),
          height: 40,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: DefaultText(text: text,style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white,),),
              ),
             const Icon(Icons.arrow_forward_ios,color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }
}
