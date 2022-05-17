import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/notifications/notifications_model.dart';
import 'package:uae_user/data/requests/notifications/notifications_request.dart';

import '../../../constants/constant_methods.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(UserNotificationsInitial());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  NotificationsModel? notificationsModel;

  void userNotifications(){
    emit(UserNotificationsLoadingState());
    NotificationsRequest.notificationsRequest().then((value) => (value) {
      notificationsModel = value;
      if(notificationsModel!.status.toString() == 200){
        emit(UserNotificationsSuccessState());
      }else{
        emit(UserNotificationsErrorState());
      }
    }).catchError((error){
      printResponse('userNotifications' + error.toString());
    });
  }

}
