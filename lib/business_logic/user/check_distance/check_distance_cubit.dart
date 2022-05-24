import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/shared_models/shared_classes/api_address.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/make_order/check_distance_model.dart';
import '../../../data/requests/make_order/check_distance_request/check_distance_request.dart';
import '../../../data/requests/make_order/make_order_request/order_location_model.dart';

part 'check_distance_state.dart';

class CheckDistanceCubit extends Cubit<CheckDistanceState> {
  CheckDistanceCubit() : super(CheckDistanceInitial());

  static CheckDistanceCubit get(context) =>
      BlocProvider.of<CheckDistanceCubit>(context);

  CheckDistanceModel checkDistanceModel = CheckDistanceModel();

  void checkDistance({required ApiAddress myAddressModel}) {
    CheckDistanceRequest()
        .checkDistanceRequest(
            orderLocation: OrderLocation(
                address: myAddressModel.address,
                latitude: myAddressModel.latitude.toDouble(),
                longitude: myAddressModel.longitude.toDouble()))
        .then((value) {
      checkDistanceModel = value;
      if (value.status == 200) {
        emit(CheckDistanceSuccessState(myAddressModel));
      } else {
        emit(CheckDistanceErrorState(checkDistanceModel.message));
      }
    }).catchError((error) {
      printResponse('checkDistance' + error.toString());
    });
  }
}
