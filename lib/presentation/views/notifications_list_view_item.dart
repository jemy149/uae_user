import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uae_user/constants/weights.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class NotificationsListViewItem extends StatelessWidget {
  const NotificationsListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,),
          child: Row(
            children: [
              Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    child: CircleAvatar(
                      radius: 35.5,
                      backgroundColor: AppColors.lightBlue,
                      child: CircleAvatar(
                        radius: 35,
                        child: Image.asset('assets/images/almahalawy.png'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: DefaultText(
                                  text: 'notification',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(fontWeight: FontWeight.bold))),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5),
                            child: DefaultText(
                                text: '2 min ago',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(fontSize: 10)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultText(
                              text: 'Dubai',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(fontSize: 10)),
                          DefaultText(
                              text: '17/4/2022',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(fontSize: 10)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: DefaultText(
                                text:
                                    'text test text test text test text test ',
                                style: Theme.of(context).textTheme.subtitle2,
                                maxLines: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
