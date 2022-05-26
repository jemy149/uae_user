import 'package:flutter/material.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeliveryInformationCardItem extends StatelessWidget {
  DeliveryInformationCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                  text: AppLocalizations.of(context)!.orderCost,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
                DefaultText(
                  text: '${48.80} AED',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: AppColors.lightGrey),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 10.0),
              child: Row(
                children: [
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000)),
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset(
                          'assets/images/chocolate.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: 'No Driver',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: Colors.white),
                          ),
                          DefaultText(
                            text: 'Delivery Representative',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child:  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      color: AppColors.lightBlue,
                      elevation: 20,
                      child:const  Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
