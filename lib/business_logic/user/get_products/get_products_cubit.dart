import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/get_products/get_products_model.dart';
import 'package:uae_user/data/requests/get_products/get_products_request.dart';

import '../../../constants/constant_methods.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());

  static GetProductsCubit get(context) => BlocProvider.of(context);

  GetProductsModel getProductsModel = GetProductsModel();

  void userGetProducts ({required int productId}){
    emit(UserGetProductsLoadingState());
    GetProductRequest()
        .getProductRequest(productId: productId)
        .then((value) {
      printTest(getProductsModel.product.toString());
      if(value.status == 200){
        getProductsModel = value;
        emit(UserGetProductsSuccessState(products: getProductsModel.product));
      }else if(value.status == 204){
        emit(UserGetProductsEmptyState());
      }
    }).catchError((error){
      emit(UserGetProductsErrorState());
      printResponse('userGetProducts' + error.toString());
    });
  }

}
