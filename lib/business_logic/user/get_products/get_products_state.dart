part of 'get_products_cubit.dart';

@immutable
abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}
class UserGetProductsSuccessState extends GetProductsState {
  Product products;
  UserGetProductsSuccessState({required this.products});
}
class UserGetProductsLoadingState extends GetProductsState {}
class UserGetProductsEmptyState extends GetProductsState {}
class UserGetProductsErrorState extends GetProductsState {}

