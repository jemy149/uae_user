import 'package:flutter/material.dart';
import 'package:uae_user/data/models/user_models/get_orders/get_orders_model.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/custome_stepper.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserOrdersItem extends StatelessWidget {
  final Function() onTap;
  final GetOrdersModel getOrdersModel;
  final int index;
   UserOrdersItem({Key? key, required this.onTap,required this.getOrdersModel, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shadowColor: AppColors.black,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        DefaultText(
                          text: '${AppLocalizations.of(context)!.orderNo} # ${getOrdersModel.orders[index].code}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontFamily: 'Bukra-Regular',
                                  fontWeight: FontWeight.bold),
                        ),
                        DefaultText(
                            text: AppLocalizations.of(context)!.uaeStores,
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DefaultText(
                        text: getOrdersModel.orders[index].status,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Bukra-Regular',
                            color: AppColors.green),
                      ),
                    )
                  ],
                ),
                 CustomeStepper(
                  isAccepted: getOrdersModel.orders[index].status == 'accept' || getOrdersModel.orders[index].status == 'تمت الموافقة' ? true : false,
                  isFinished: getOrdersModel.orders[index].status == 'finished' || getOrdersModel.orders[index].status == 'تم التوصيل' ? true : false,
                  isProgressing: getOrdersModel.orders[index].status == 'progressing' || getOrdersModel.orders[index].status == 'جاري التنفيذ' ? true : false,
                  isWaiting: getOrdersModel.orders[index].status == 'waiting' || getOrdersModel.orders[index].status == 'في الانتظار' ? true : false,
                  isWaitingForDelivery: getOrdersModel.orders[index].status == 'processing' || getOrdersModel.orders[index].status == 'الطلب في الطريق' ? true : false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
