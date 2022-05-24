import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/cart/get_my_cart_model.dart';
import '../../../data/requests/cart/get_my_cart_request.dart';

part 'get_my_cart_state.dart';

class GetMyCartCubit extends Cubit<GetMyCartState> {
  GetMyCartCubit() : super(GetMyCartInitial());


  GetMyCartModel getMyCartModel = GetMyCartModel();

  void userGetCart (){
    emit(UserGetCartLoadingState());
    GetMyCartRequest()
        .getMyCartRequest()
        .then((value) {
      printTest(getMyCartModel.carts.toString());
      if(value.status == 200){
        getMyCartModel = value;
        emit(UserGetCartSuccessState(cart: getMyCartModel.carts));
      }else if(value.status == 204){
        emit(UserGetCartEmptyState());
      }
    }).catchError((error){
      emit(UserGetCartErrorState());
      printResponse('userAddToCart' + error.toString());
    });
  }

}
