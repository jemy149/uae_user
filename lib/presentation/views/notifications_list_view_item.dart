import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uae_user/business_logic/user/notifications/notifications_cubit.dart';
import 'package:uae_user/data/models/user_models/notifications/notifications_model.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_cached_network_image.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class NotificationsListViewItem extends StatelessWidget {
final  Notifications notification;
   NotificationsListViewItem( 
      {Key? key,required this.notification,})
      : super(key: key);

   

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
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
                        child: DefaultCachedNetworkImage(imageUrl: notification.content, fit: BoxFit.contain,),
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
                                  text: notification.content,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(fontWeight: FontWeight.bold))),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5),
                            child: DefaultText(
                                text: notification.createdAt.toString(),
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
                              text: notification.id.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(fontSize: 10)),
                          DefaultText(
                              text: notification.createdAt.toString(),
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
                                text: notification.content,
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
