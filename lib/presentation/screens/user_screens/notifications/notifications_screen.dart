import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/notifications/notifications_cubit.dart';
import 'package:uae_user/presentation/views/notifications_list_view_item.dart';

import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  NotificationsCubit? _notificationsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit()..userNotifications(),
      child: SafeArea(
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
                        text: AppLocalizations.of(context)!.notifications,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontFamily: 'Bukra-Regular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      )),
                ],
              ),
            ),
            body: Builder(builder: (context) {
              _notificationsCubit = NotificationsCubit.get(context);
              return BlocBuilder<NotificationsCubit, NotificationsState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemBuilder: (context, index) => NotificationsListViewItem(
                      notificationBody: _notificationsCubit!
                          .notificationsModel!.notifications![index].content!,
                      notificationHeadLine: _notificationsCubit!
                          .notificationsModel?.notifications?[index].title,
                      notificationDate: _notificationsCubit!
                          .notificationsModel!.notifications![index].createdAt!,
                      // notificationPlace: _notificationsCubit!.notificationsModel?.notifications?[index].order!.orderLocation!.address,
                      // notificationTime: _notificationsCubit!.notificationsModel!.notifications![index].order!.deliveryTime.toString(),
                    ),
                    itemCount: _notificationsCubit!
                        .notificationsModel!.notifications!.length,
                  );
                },
              );
            })),
      ),
    );
  }
}
