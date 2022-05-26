part of 'get_orders_cubit.dart';

@immutable
abstract class GetOrdersState {}

class GetOrdersInitial extends GetOrdersState {}
class UserGetOrdersSuccessState extends GetOrdersState {
  List<Orders> orders;
  UserGetOrdersSuccessState({required this.orders});
}
class UserGetOrdersLoadingState extends GetOrdersState {}
class UserGetOrdersEmptyState extends GetOrdersState {}
class UserGetOrdersErrorState extends GetOrdersState {}

