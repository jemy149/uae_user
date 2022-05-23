part of 'category_cubit.dart';

@immutable
abstract class CategoryStates {}

class UserCategoryInitialState extends CategoryStates {}
class UserCategorySuccessState extends CategoryStates {
  final List<Categories> userCategories;
  UserCategorySuccessState({required this.userCategories});
}



class UserCategoryLoadingState extends CategoryStates {}
class UserCategoryErrorState extends CategoryStates {}



class UserSubCategoryInitial extends CategoryStates {}
class UserSubCategorySuccessState extends CategoryStates {
  final List<SubCategories> userSubCategories;
  UserSubCategorySuccessState({required this.userSubCategories});
}
class UserSubCategoryLoadingState extends CategoryStates {}
class UserSubCategoryErrorState extends CategoryStates {}



