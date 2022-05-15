import 'package:flutter/material.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WalletCardItem extends StatelessWidget {
  const WalletCardItem({Key? key,required this.text,required this.points, this.countText = 'AED'}) : super(key: key);
  final String text;
  final String points;
  final String countText;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
          child: Row(
            
            children: [
              Expanded(
                child: DefaultText(
                  text: text,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.grey,
                      ),
                ),
              ),
              DefaultText(
                text: '${points} ${countText}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.lightBlue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
