import 'package:flutter/material.dart';
import 'package:uae_user/business_logic/user/my_addresses/my_addresses_cubit.dart';
import 'package:uae_user/data/models/shared_models/shared_classes/api_address.dart';
import '../styles/colors.dart';
import 'default_text.dart';

class CustomeDropDownListInnerTextWidget extends StatelessWidget {
  final ApiAddress myAddressModel;
  final MyAddressesCubit myAddressesCubit;
  const CustomeDropDownListInnerTextWidget( {Key? key,required this.myAddressModel,required this.myAddressesCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        myAddressesCubit.chooseAddress(apiAddress: myAddressModel);
      },
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
            text: myAddressModel.address,
            maxLines: 1,
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
