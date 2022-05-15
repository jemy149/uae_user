import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/constants/screens.dart';
import 'package:uae_user/presentation/views/user_addresses_card_item.dart';

import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class UserAddressesScreen extends StatelessWidget {
  const UserAddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    text: AppLocalizations.of(context)!.myAddresses,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(
                      fontFamily: 'Bukra-Regular',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 20.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ADDING_ADDITIONAL_LOCATION_SCREEN_R);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(child: Icon(Icons.add_box_outlined)),
                          Expanded(
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.only(start: 15.0),
                                child: DefaultText(
                                    text: AppLocalizations.of(context)!
                                        .addNewAddress),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(itemBuilder: (context, index) =>
                UserAddressesCardItem(remove: () {}), itemCount: 20,
            physics:const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),

          ],
        ),
      ),
    );
  }
}
