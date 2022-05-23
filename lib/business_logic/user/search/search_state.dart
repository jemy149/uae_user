part of 'search_cubit.dart';

@immutable
abstract class SearchState {}


class UserSearchInitialState extends SearchState {}
class UserSearchLoadingState extends SearchState {}
class UserSearchSuccessState extends SearchState {
 List<Products> products;
  UserSearchSuccessState({required this.products});
}
class UserSearchErrorState extends SearchState {}
class UserSearchEmptyState extends SearchState {}
