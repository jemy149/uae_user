part of 'home_product_search_cubit.dart';

@immutable
abstract class UserProductSearchStates {}

class HomeProductSearchInitial extends UserProductSearchStates {}
class UserProductSearchLoadingState extends UserProductSearchStates {}

class UserProductSearchSuccessState extends UserProductSearchStates {}
class UserProductSearchEmptyState extends UserProductSearchStates {}

class UserProductSearchErrorState extends UserProductSearchStates {}




class UserProductBarcodeSearchLoadingState extends UserProductSearchStates {}

class UserProductBarcodeSearchSuccessState extends UserProductSearchStates {}
class UserProductBarcodeSearchEmptyState extends UserProductSearchStates {}

class UserProductBarcodeSearchErrorState extends UserProductSearchStates {}



class UserFilterSearchLoadingState extends UserProductSearchStates {}

class UserFilterSearchSuccessState extends UserProductSearchStates {}
class UserFilterSearchEmptyState extends UserProductSearchStates {}

class UserFilterSearchErrorState extends UserProductSearchStates {}
