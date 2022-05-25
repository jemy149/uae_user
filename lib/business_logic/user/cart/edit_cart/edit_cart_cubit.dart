import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/cart/edit_cart_model.dart';
import 'package:uae_user/data/requests/cart/edit_cart_request.dart';

import '../../../../constants/constant_methods.dart';

part 'edit_cart_state.dart';

class EditCartCubit extends Cubit<EditCartState> {
  EditCartCubit() : super(EditCartInitial());
  static EditCartCubit get(context) => BlocProvider.of(context);

  EditCartModel editCartModel = EditCartModel();

  void userEditCart ({required int cartId,required int quantity}){
    emit(UserEditCartLoadingState());
    EditCartRequest.editCartRequest(cartId: cartId, quantity: quantity)
        .then((value) {
      printTest(editCartModel.message.toString());
      if(value.status == 200){
        editCartModel = value;
        emit(UserEditCartSuccessState(msg: editCartModel.message));
      }else{
        emit(UserEditCartErrorState());
      }
    }).catchError((error){

      printResponse('userEditCart' + error.toString());
    });
  }

}
