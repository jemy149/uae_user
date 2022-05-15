import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeOffersCardItem extends StatelessWidget {
  const HomeOffersCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/images/fruits.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8.0,start: 5.0,end: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 55.0),
                        child: DefaultMaterialButton(
                          text: AppLocalizations.of(context)!.offersAddButton,
                          onTap: () {},
                          height: 25,
                          width: 60,
                          color: AppColors.lightBlue,
                          textColor: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const Icon(
                        Icons.favorite_outline,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          DefaultText(
            text: 'ietm name',
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(fontFamily: 'Bukra-Regular',fontWeight: FontWeight.bold),
          ),
          const Text(
            '${0.0}',
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          const DefaultText(text: '${80.00} RS')
        ],
      ),
    );
  }
}
