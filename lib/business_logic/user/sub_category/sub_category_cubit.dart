import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/categories/sub_category_model.dart';
import '../../../data/requests/categories/sub_category_request.dart';

part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit() : super(UserSubCategoryInitial());

  static SubCategoryCubit get(context) => BlocProvider.of(context);

  SubCategoryModel subCategoryModel = SubCategoryModel();

  void userSubCategories ({required int subCategoryId}){
    emit(UserSubCategoryLoadingState());
    SubCategoryRequest()
        .subCategoryRequest(page: 0,categoryId: subCategoryId)
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
