import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/views/custome_drop_down_list.dart';
import 'package:uae_user/presentation/widgets/default_form_field.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';
import 'package:uae_user/presentation/widgets/delivery_details_form_field.dart';

import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  DeliveryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController infoController = TextEditingController();

  Widget _dropdownValue =  DefaultText(text: 'Dash');

  List<Widget> dropDownOptions = [
    DefaultText(text: 'Dash'),
    DefaultText(text: 'Sparky'),
    DefaultText(text: 'Snoo'),
    DefaultText(text: 'Clippy'),

  ];

   dropdownCallback(Widget? selectedValue) {
    if (selectedValue is Widget) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

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
                  text: AppLocalizations.of(context)!.deliveryDetails,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontFamily: 'Bukra-Regular',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const CustomeDropDownList(),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10.0),
                child: DeliveryDetailsFormField(
                  backgroundColor: AppColors.grey.withOpacity(0.3),
                  radius: 25,
                  height: 100,
                  controller: phoneNumberController,
                  validator: (p) {},
                  keyboardType: TextInputType.number,
                  hintText: AppLocalizations.of(context)!.phoneNumber,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10.0),
                child: DeliveryDetailsFormField(
                  backgroundColor: AppColors.grey.withOpacity(0.3),
                  radius: 25,
                  height: 100,
                  controller: emailController,
                  validator: (p) {},
                  keyboardType: TextInputType.emailAddress,
                  hintText: AppLocalizations.of(context)!.email,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10.0),
                child: DeliveryDetailsFormField(
                  backgroundColor: AppColors.grey.withOpacity(0.3),
                  radius: 25,
                  height: 100,
                  controller: nameController,
                  validator: (p) {},
                  keyboardType: TextInputType.name,
                  hintText: AppLocalizations.of(context)!.name,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10.0),
                child: DeliveryDetailsFormField(
                  backgroundColor: AppColors.grey.withOpacity(0.3),
                  radius: 25,
                  height: 100,
                  controller: infoController,
                  validator: (p) {},
                  keyboardType: TextInputType.text,
                  hintText: AppLocalizations.of(context)!.addressInstructions,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    DefaultMaterialButton(
                      text: AppLocalizations.of(context)!.confirm,
                      onTap: () {Navigator.pushNamed(context, DELIVERY_LOCATION_SCREEN_R);},
                      height: 60,
                      width: 250,
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
      ),
    ));
  }
}
