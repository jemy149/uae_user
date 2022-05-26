import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/notifications/notifications_cubit.dart';
import 'package:uae_user/presentation/views/notifications_list_view_item.dart';

import '../../../styles/colors.dart';
import '../../../widgets/DefaultSvg.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_text.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  late NotificationsCubit _notificationsCubit;

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

              return BlocBuilder<NotificationsCubit, NotificationsState>(
                builder: (context, state) {

                  if (state is UserNotificationsSuccessState) {
                    return ListView.builder(
                      itemBuilder: (context, index) => NotificationsListViewItem(notification:state.notifications[index]),
                      itemCount: state.notifications.length,
                    );
                  }else if (state is UserNotificationsLoadingState) {
                    return const DefaultLoadingIndicator();
                  } else if (state is UserNotificationsEmptyState) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const DefaultSvg(
                            imagePath:
                            'assets/icons/no_search_data.svg',

                          ),
                          DefaultText(
                            text: AppLocalizations.of(context)!.noResultsFound,

                            textStyle:
                            Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                    );
                  } else {
                    return const DefaultErrorWidget();
                  }

                },
              );
            })),
      ),
    );
  }
}
