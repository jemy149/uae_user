import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/addresses/add_address_model.dart';
import 'package:uae_user/data/requests/addresses/add_address_request.dart';

import '../../../constants/constant_methods.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {

  AddAddressCubit() : super(AddAddressInitial());

  static AddAddressCubit get(context) => BlocProvider.of(context);
  AddAddressModel addAddressModel = AddAddressModel();

  Future<String> convertAddress ({
    required double lat,
    required double lon,
  }) async {
   return await convertPositionToAddress(lat: lat, lon: lon);
  }


  void addAddress({
    required num locationLongitude,
    required num locationLatitude,
    required String locationAddress,
}) async{
    emit(UserAddAddressLoadingState());
    AddAddressesRequest().addAddressesRequest(
        locationLongitude: locationLongitude,
        locationLatitude: locationLatitude,
        locationAddress:await convertAddress(lat: locationLatitude.toDouble(), lon: locationLongitude.toDouble()),
        isDefaultAddress: 0,
        description: 'description').then((value) {
      addAddressModel = value;
      if (value.status == 200) {
        emit(UserAddAddressSuccessState());
      } else {
        emit(UserAddAddressErrorState());
      }
    }).catchError((error) {
      printResponse('addAddress' + error.toString());
    });
  }
}
