import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class NotificationsListViewItem extends StatelessWidget {
  const NotificationsListViewItem(
      {Key? key,
       this.imagePath,
      required this.notificationHeadLine,
       this.notificationTime,
       this.notificationPlace,
      required this.notificationDate,
      required this.notificationBody})
      : super(key: key);

  final String? imagePath;
  final String notificationHeadLine;
  final String? notificationTime;
  final String? notificationPlace;
  final int notificationDate;
  final String notificationBody;

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
                        child: Image.network(imagePath!),
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
                                  text: notificationHeadLine,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(fontWeight: FontWeight.bold))),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5),
                            child: DefaultText(
                                text: notificationTime!,
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
                              text: notificationPlace!,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(fontSize: 10)),
                          DefaultText(
                              text: '${notificationDate}',
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
                                text: notificationBody,
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
