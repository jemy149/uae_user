import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/get_orders/get_orders_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/requests/get_orders/get_orders_request.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit() : super(GetOrdersInitial());

  static GetOrdersCubit get(context) => BlocProvider.of(context);

  GetOrdersModel getOrdersModel = GetOrdersModel();

  void userGetOrders (){
    emit(UserGetOrdersLoadingState());
    GetOrdersRequest
        .getOrdersRequest()
        .then((value) {
      printTest(getOrdersModel.orders.toString());
      if(value.status == 200){
        getOrdersModel = value;
        emit(UserGetOrdersSuccessState(orders: getOrdersModel.orders));
      }else if(value.status == 204){
        emit(UserGetOrdersEmptyState());
      }
    }).catchError((error){
      emit(UserGetOrdersErrorState());
      printResponse('userGetOrders' + error.toString());
    });
  }

}
