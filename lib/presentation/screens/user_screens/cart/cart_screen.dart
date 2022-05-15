
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/views/cart_item.dart';

import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.lightBlue,

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
                  text: AppLocalizations.of(context)!.cart,
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
        children: [
          Flexible(
              flex: 10, child: Container(
            decoration:const BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: ListView.builder(itemBuilder: (context,index)=>const CartItem(),itemCount: 10,)),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DefaultText(text: AppLocalizations.of(context)!.total,
                      style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                     Padding(
                      padding:const EdgeInsets.all(20.0),
                      child: DefaultText(text: '${10.00} AED',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ],
            ),
          )),
          Flexible(
              flex: 2,
              child: Container(
                color: AppColors.lightBlue,
                child: Center(
                  child: InkWell(
                    onTap: (){Navigator.pushNamed(context, DELIVERY_DETAILS_SCREEN_R);},
                    child: Container(
                      padding:const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: DefaultText(text: (AppLocalizations.of(context)!.completeOrder),
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                fontFamily: 'Bukra-Regular',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const  Padding(
                           padding: EdgeInsetsDirectional.only(end: 1.0),
                           child: CircleAvatar(
                             radius: 22,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.arrow_forward_ios,color: AppColors.lightBlue,),
                            ),
                         )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
