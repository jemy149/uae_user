part of 'make_order_cubit.dart';

@immutable
abstract class MakeOrderState {}

class MakeOrderInitial extends MakeOrderState {}

class UserMakeOrderInitial extends MakeOrderState {}
class UserMakeOrderLoadingState extends MakeOrderState {}
class UserMakeOrderSuccessState extends MakeOrderState {
  Order makeOrder;
  UserMakeOrderSuccessState({required this.makeOrder});
}
class UserMakeOrderEmptyState extends MakeOrderState {}
class UserMakeOrderIssueState extends MakeOrderState {
  String msg;
  UserMakeOrderIssueState({required this.msg});
}
class UserMakeOrderErrorState extends MakeOrderState {}
