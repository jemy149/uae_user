import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uae_user/business_logic/user/my_addresses/my_addresses_cubit.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/constants/enums.dart';
import 'package:uae_user/data/models/shared_models/shared_classes/api_address.dart';
import 'package:uae_user/data/requests/make_order/make_order_request/order_location_model.dart';

import '../../business_logic/user/check_distance/check_distance_cubit.dart';
import '../styles/colors.dart';
import 'default_text.dart';

class CustomeDropDownListInnerTextWidget extends StatefulWidget {
  final ApiAddress myAddressModel;

  const CustomeDropDownListInnerTextWidget(
      {Key? key, required this.myAddressModel,})
      : super(key: key);

  @override
  State<CustomeDropDownListInnerTextWidget> createState() =>
      _CustomeDropDownListInnerTextWidgetState();
}

class _CustomeDropDownListInnerTextWidgetState
    extends State<CustomeDropDownListInnerTextWidget> {
  late CheckDistanceCubit _checkDistanceCubit;

  @override
  void initState() {
    _checkDistanceCubit = CheckDistanceCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _checkDistanceCubit.checkDistance(myAddressModel:
             widget.myAddressModel );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.grey.withOpacity(0.6),
            height: 1,
            width: double.maxFinite,
            margin: const EdgeInsetsDirectional.only(bottom: 8, top: 5),
          ),
          DefaultText(
            text: widget.myAddressModel.address,
            maxLines: 2,
            style: Theme
                .of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: AppColors.grey.withOpacity(0.6)),
          )
        ],
      ),
    );
  }
}
