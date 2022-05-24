part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}
class UserFilterGetBrandSuccessState extends FilterState {
  List<Brands> brands;
  UserFilterGetBrandSuccessState({required this.brands});
}
class UserFilterGetBrandLoadingState extends FilterState {}
class UserFilterGetBrandErrorState extends FilterState {}
class UserFilterGetBrandEmptyState extends FilterState {}

