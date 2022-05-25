import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/business_logic/user/cart/get_my_cart/get_my_cart_cubit.dart';
import 'package:uae_user/data/models/user_models/cart/delete_cart_model.dart';
import 'package:uae_user/data/models/user_models/cart/get_my_cart_model.dart';
import 'package:uae_user/data/requests/cart/delete_cart_request.dart';

import '../../../../constants/constant_methods.dart';

part 'delete_cart_state.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  DeleteCartCubit() : super(DeleteCartInitial());
  static DeleteCartCubit get(context) =>BlocProvider.of<DeleteCartCubit>(context);

  DeleteCartModel deleteCartModel = DeleteCartModel();


   userDeleteCart ({required int cartId,}){
    DeleteCartRequest.deleteCartRequest(cartId: cartId,)
        .then((value) {
      printTest(deleteCartModel.message.toString());
      if(value.status == 200){
        deleteCartModel = value;
        emit(UserDeleteCartSuccessState());
      }else{
        emit(UserDeleteCartErrorState());
      }
    }).catchError((error){
      printResponse('userDeleteCart' + error.toString());
    });
  }


}
