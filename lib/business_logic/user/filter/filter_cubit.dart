import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/get_brands/get_brands_model.dart';
import 'package:uae_user/data/requests/get_brands/get_brands_request.dart';

import '../../../constants/constant_methods.dart';
part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  static FilterCubit get(context) => BlocProvider.of(context);

  //////////////////////////////// Get Brand Names in Filter Screen ////////////////////////////////

  GetBrandsModel getBrandsModel = GetBrandsModel();

  void userGetBrandsCubit ({required subCategoryId,}){
    emit(UserFilterGetBrandLoadingState());
    GetBrandsRequest()
        .getBrandsRequest(subCategoryId:subCategoryId, )
        .then((value) {
      printTest(getBrandsModel.brands.toString());
      if(value.status == 200){
        getBrandsModel = value;
        emit(UserFilterGetBrandSuccessState(brands:getBrandsModel.brands));
      }else if(value.status == 204){
        emit(UserFilterGetBrandEmptyState());
      }
    }).catchError((error){
      emit(UserFilterGetBrandErrorState());
      printResponse('userGetBrandsCubit' + error.toString());
    });
  }

}
