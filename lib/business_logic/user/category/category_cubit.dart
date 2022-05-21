import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/categories/main_category_model.dart';
import 'package:uae_user/data/requests/categories/main_category_request.dart';

import '../../../constants/constant_methods.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(UserCategoryInitialState());


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
}
