import 'package:flutter/material.dart';
import 'package:uae_user/constants/weights.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 5,
        child: Row(
          children: [
            Flexible(
              child: Image.asset(
                'assets/images/coffee.png',
                height: 100,
                width: 100,
              ),
            ),
            Expanded(
              flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  DefaultText(
                    text: 'item name',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeights.bold,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: DefaultText(
                      text: '${16.95} AED',
                      style: Theme.of(context).textTheme.caption
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                      child: DefaultText(
                        text: '${1}',
                        style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.white)
                      ),
                    ),
                  ),

              ],
            ),
                ))
          ],
        ),
      ),
    );
  }
}
