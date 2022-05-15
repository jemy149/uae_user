import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/views/user_orders_item.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightBlue,
          leading: IconButton(
            icon: Image.asset('assets/images/bell1.png'),
            onPressed: () {Navigator.pushNamed(context, NOTIFICATIONS_SCREEN_R);},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultText(
                text: AppLocalizations.of(context)!.myOrders,
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Stack(
                alignment: Alignment.topRight,
                children: const [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.lightGreenAccent,
                    radius: 5.0,
                    child: Center(
                      child: Text(
                        '0',
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.builder(itemBuilder:(context,index)=> UserOrdersItem(
          onTap: () {
            Navigator.pushNamed(context, TRACKING_ORDER_SCREEN_R);
          },
        ),
        itemCount: 10,
        ),
      ),
    );
  }
}
