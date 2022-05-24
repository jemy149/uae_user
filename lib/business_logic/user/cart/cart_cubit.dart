import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/cart/add_to_cart_model.dart';
import 'package:uae_user/data/requests/cart/add_to_cart_request.dart';

import '../../../constants/constant_methods.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(UserCartInitialStates());

  static CartCubit get(context) => BlocProvider.of(context);


  AddToCartModel addToCartModel = AddToCartModel();

  void userAddToCart ({required productId}){
    emit(UserCartLoadingStates());
    AddToCartRequest()
        .addToCartRequest(productId:productId )
        .then((value) {
      printTest(addToCartModel.account.toString());
      if(value.status == 200){
        addToCartModel = value;
        emit(UserCartSuccessStates());
      }else {
        emit(UserCartErrorStates());
      }
    }).catchError((error){
      printResponse('userAddToCart' + error.toString());
    });
  }



}
