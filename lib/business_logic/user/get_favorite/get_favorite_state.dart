part of 'get_favorite_cubit.dart';

@immutable
abstract class GetFavoriteState {}

class GetFavoriteInitial extends GetFavoriteState {}

class GetFavoriteLoadingState extends GetFavoriteState {}

class GetFavoriteSuccessState extends GetFavoriteState {}

class GetFavoriteEmptyState extends GetFavoriteState {}

class GetFavoriteErrorState extends GetFavoriteState {}
class RemoveItemState extends GetFavoriteState {}
