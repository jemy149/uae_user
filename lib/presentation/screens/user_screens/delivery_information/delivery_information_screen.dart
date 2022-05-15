import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/views/delivery_information_card_item.dart';

import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class DeliveryInformationScreen extends StatelessWidget {
  const DeliveryInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.lightBlue,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsetsDirectional.only(end: 60),
                    child: DefaultText(
                      text: AppLocalizations.of(context)!.deliveryInformation,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontFamily: 'Bukra-Regular',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
          body: Stack(
            children: [
              SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Image.asset('assets/images/map.png',fit: BoxFit.cover)),
              Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
                  child: DeliveryInformationCardItem(),
                ),
              ],
            )],
          ),
    ));
  }
}
