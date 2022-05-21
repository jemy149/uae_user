part of 'sub_category_cubit.dart';

@immutable
abstract class SubCategoryState {}

class UserSubCategoryInitial extends SubCategoryState {}
class UserSubCategorySuccessState extends SubCategoryState {
  final List<Categories> userSubCategories;
  UserSubCategorySuccessState({required this.userSubCategories});
}
class UserSubCategoryLoadingState extends SubCategoryState {}
class UserSubCategoryErrorState extends SubCategoryState {}
