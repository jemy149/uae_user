import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/addresses/add_address_model.dart';
import 'package:uae_user/data/requests/addresses/add_address_request.dart';

import '../../../constants/constant_methods.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit() : super(AddAddressInitial());

  static AddAddressCubit get(context) => BlocProvider.of(context);
  AddAndEditAddressModel addAddressModel = AddAndEditAddressModel();

  Future<String> convertAddress({
    required double lat,
    required double lon,
  }) async {
    return await convertPositionToAddress(lat: lat, lon: lon);
  }

  void addAddress({
    required num locationLongitude,
    required num locationLatitude,
  }) async {
    emit(UserAddAddressLoadingState());
    AddAndEditAddressesRequest()
        .addAndEditAddressesRequest(
      locationLongitude: locationLongitude,
      locationLatitude: locationLatitude,
      locationAddress: await convertAddress(
          lat: locationLatitude.toDouble(), lon: locationLongitude.toDouble()),
      isDefaultAddress: 0,
    )
        .then((value) {
      addAddressModel = value;
      if (value.status == 200) {
        emit(UserAddAddressSuccessState(addAddressModel.message));
      } else {
        emit(UserAddAddressErrorState(addAddressModel.message));
      }
    }).catchError((error) {
      printResponse('addAddress' + error.toString());
    });
  }
}
