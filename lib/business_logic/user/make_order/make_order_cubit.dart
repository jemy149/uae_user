import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/make_order/make_order_model.dart';
import 'package:uae_user/data/requests/make_order/make_order_request/make_order_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/requests/make_order/make_order_request/order_location_model.dart';

part 'make_order_state.dart';

class MakeOrderCubit extends Cubit<MakeOrderState> {
  MakeOrderCubit() : super(MakeOrderInitial());

  static MakeOrderCubit get(context) => BlocProvider.of(context);

  MakeOrderModel makeOrderModel = MakeOrderModel();

   userMakeOrder(
      {String? deliveryTime,
      MakeOrderLocation? makeOrderLocation,
      String? extraDescription,
      String? paymentMethod,
      String? paymentId}) {
    emit(UserMakeOrderLoadingState());
    MakeOrderRequest.makeOrderRequest(
      deliveryTime: deliveryTime,
      extraDescription: extraDescription,
      makeOrderLocation: makeOrderLocation,
      paymentMethod: paymentMethod,
      paymentId: paymentId,
    ).then((value) {
      printTest(makeOrderModel.toString());
      if (value.status == 200) {
        makeOrderModel = value;
        emit(UserMakeOrderSuccessState(makeOrder: makeOrderModel.order));
      } else if (value.status == 430) {
        emit(UserMakeOrderIssueState(msg: makeOrderModel.message));
      } else if (value.status == 204) {
        emit(UserMakeOrderEmptyState());
      }
    }).catchError((error) {
      emit(UserMakeOrderErrorState());
      printResponse('userMakeOrder' + error.toString());
    });
  }
}
