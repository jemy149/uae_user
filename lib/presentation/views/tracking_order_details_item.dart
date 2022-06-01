import 'package:flutter/material.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import '../widgets/default_text.dart';

class TrackingOrderDetailsItem extends StatelessWidget {
  final String titleText;
  final String subTitleText;

  const TrackingOrderDetailsItem({Key? key, required this.titleText,required this.subTitleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            text: titleText,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bukra-Regular',
                  color: AppColors.lightBlue,
              fontSize: 15,
                ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 30),
              child: DefaultText(text: subTitleText,style: Theme.of(context).textTheme.button,
              maxLines: 10,
                textDirection: TextDirection.rtl,
              ),
            ),
          )
        ],
      ),
    );
  }
}
