part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class UserNotificationsInitial extends NotificationsState {}
class UserNotificationsLoadingState extends NotificationsState {}
class UserNotificationsSuccessState extends NotificationsState {
  List<Notifications> notifications;
  UserNotificationsSuccessState({required this.notifications});
}
class UserNotificationsEmptyState extends NotificationsState {}
class UserNotificationsErrorState extends NotificationsState {}
