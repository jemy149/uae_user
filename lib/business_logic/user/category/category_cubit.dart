import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/categories/main_category_model.dart';
import 'package:uae_user/data/requests/categories/main_category_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/categories/sub_category_model.dart';
import '../../../data/models/user_models/search/search_model.dart';
import '../../../data/requests/categories/sub_category_request.dart';
import '../../../data/requests/search/price_model.dart';
import '../../../data/requests/search/search_request.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(UserCategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);



////////////////////////////////// main categories ////////////////////////////////
  MainCategoryModel categoryModel = MainCategoryModel();

  void userCategories (){
    emit(UserCategoryLoadingState());
    MainCategoryRequest()
        .mainCategoryRequest(page: 0)
        .then((value) {
      if(value.status == 200){
        categoryModel = value;
        emit(UserCategorySuccessState(userCategories: categoryModel.categories));
      }else {
        emit(UserCategoryErrorState());
      }
    }).catchError((error){
      printResponse('userCategories' + error.toString());
    });
  }


  ////////////////////////////////// main categories ////////////////////////////////
  SubCategoryModel subCategoryModel = SubCategoryModel();

  void userSubCategories ({required int mainCategoryId}){
    emit(UserSubCategoryLoadingState());
    SubCategoryRequest()
        .subCategoryRequest(page: 0,categoryId: mainCategoryId)
        .then((value) {
      if(value.status == 200){
        subCategoryModel = value;

        emit(UserSubCategorySuccessState(userSubCategories: subCategoryModel.categories));
      }else {
        emit(UserSubCategoryErrorState());
      }
    }).catchError((error){
      printResponse('userSubCategories' + error.toString());
    });
  }



}
