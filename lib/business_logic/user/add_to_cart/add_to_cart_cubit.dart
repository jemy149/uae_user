import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/cart/add_to_cart_model.dart';
import 'package:uae_user/data/requests/cart/add_to_cart_request.dart';
import '../../../constants/constant_methods.dart';
part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(UserCartInitialStates());

  static AddToCartCubit get(context) => BlocProvider.of(context);

  //////////////////////////////// Add To Cart ////////////////////////////////

  AddToCartModel addToCartModel = AddToCartModel();

  void userAddToCart ({required productId}){
    emit(UserAddCartLoadingStates());
    AddToCartRequest()
        .addToCartRequest(productId:productId )
        .then((value) {
      if(value.status == 200){
        addToCartModel = value;
        emit(UserAddCartSuccessStates());
      }else {
        emit(UserAddCartErrorStates());
      }
    }).catchError((error){
      printResponse('userAddToCart' + error.toString());
    });
  }



}
