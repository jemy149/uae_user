import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/cart/add_to_cart_model.dart';
import 'package:uae_user/data/requests/cart/add_to_cart_request.dart';
import '../../../constants/constant_methods.dart';
part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(UserAddToCartInitialStates());

  static AddToCartCubit get(context) => BlocProvider.of(context);

  //////////////////////////////// Add To Cart ////////////////////////////////

  AddToCartModel addToCartModel = AddToCartModel();

  void userAddToCart ({required productId, quantity,}){
    emit(UserAddToCartLoadingStates());
    AddToCartRequest()
        .addToCartRequest(productId:productId,quantity: quantity )
        .then((value) {
      if(value.status == 200){
        addToCartModel = value;
        emit(UserAddToCartSuccessStates(message: addToCartModel.message));
      }else  if(value.status == 430){
        emit(UserAddToCartNotAvailableStates());
      }
    }).catchError((error){
      emit(UserAddToCartErrorStates());
      printResponse('userAddToCart' + error.toString());
    });
  }



}
