import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';

import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';
import '../user_addresses/user_addresses_screen.dart';

class AddingAdditionalLocationScreen extends StatelessWidget {
  const AddingAdditionalLocationScreen({Key? key}) : super(key: key);

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
                    text: AppLocalizations.of(context)!.location,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontFamily: 'Bukra-Regular',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultMaterialButton(
                    text: AppLocalizations.of(context)!.setAddress,
                    onTap: (){Navigator.pop(context);},
                    height: 60,
                    width: 200,
                    color: AppColors.lightBlue,
                    textColor: Colors.white,
                    fontSize: 18,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
