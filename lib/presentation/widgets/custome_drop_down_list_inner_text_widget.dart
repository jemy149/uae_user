import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'default_text.dart';

class CustomeDropDownListInnerTextWidget extends StatelessWidget {
  const CustomeDropDownListInnerTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.grey.withOpacity(0.6),
            height: 1,
            width: double.maxFinite,
            margin: const EdgeInsetsDirectional.only(bottom: 8,top: 5),
          ),
          DefaultText(
            text: 'an added address',
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: AppColors.grey.withOpacity(0.6)),
          )
        ],
      ),
    );
  }
}
