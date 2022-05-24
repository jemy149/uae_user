import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/shared_models/shared_classes/api_address.dart';
import 'package:uae_user/data/models/user_models/addresses/add_address_model.dart';
import 'package:uae_user/data/models/user_models/addresses/delete_address_model.dart';
import 'package:uae_user/data/models/user_models/addresses/my_addresses_model.dart';
import 'package:uae_user/data/requests/addresses/delete_address_request.dart';
import 'package:uae_user/data/requests/addresses/my_addresses_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/requests/addresses/add_address_request.dart';

part 'my_addresses_state.dart';

class MyAddressesCubit extends Cubit<MyAddressesState> {

  MyAddressesCubit() : super(MyAddressesInitial());

  static MyAddressesCubit get(context) => BlocProvider.of(context);

  MyAddressesModel myAddressesModel = MyAddressesModel();

  void getMyAddresses() {
    emit(UserGetMyAddressesLoadingState());
    MyAddressesRequest().myAddressesRequest().then((value) {
      myAddressesModel = value;
      if (value.status == 200) {
        emit(UserGetMyAddressesSuccessState());
      } else if (value.status == 204) {
        emit(UserGetMyAddressesEmptyState());
      } else {
        emit(UserGetMyAddressesErrorState());
      }
    }).catchError((error) {
      printResponse('getMyAddresses' + error.toString());
    });
  }

  DeleteAddressModel deleteAddressModel = DeleteAddressModel();

  void deleteAddress({required int locationId, required int index}) {
    emit(UserDeleteAddressLoadingState());
    DeleteAddressRequest()
        .deleteAddressRequest(locationId: locationId)
        .then((value) {
      deleteAddressModel = value;
      if (value.status == 200) {
        myAddressesModel.myAddress.removeAt(index);
        if (myAddressesModel.myAddress.isEmpty) {
          emit(UserGetMyAddressesEmptyState());
        } else {
          emit(UserDeleteAddressSuccessState(deleteAddressModel.message));
        }
      } else {
        emit(UserDeleteAddressErrorState(deleteAddressModel.message));
      }
    }).catchError((error) {
      printResponse('deleteAddress' + error.toString());
    });
  }

  AddAndEditAddressModel editAddressModel = AddAndEditAddressModel();

  void editAddressOrDescription({
    required int index,
    required int locationId,
    required num locationLongitude,
    required num locationLatitude,
    required String locationAddress,
    required int isDefaultAddress,
    required String description,
  }) async {
    AddAndEditAddressesRequest()
        .addAndEditAddressesRequest(
      locationLongitude: locationLongitude,
      locationLatitude: locationLatitude,
      locationAddress: locationAddress,
      description: description,
      isDefaultAddress: isDefaultAddress,
      locationId: locationId,
    )
        .then((value) {
      editAddressModel = value;
      if (value.status == 200) {
        myAddressesModel.myAddress[index].setAddress = locationAddress;
        myAddressesModel.myAddress[index].setDescription = description;
        emit(UserEditAddressSuccessState(editAddressModel.message));
      } else {
        emit(UserEditAddAddressErrorState(editAddressModel.message));
      }
    }).catchError((error) {
      printResponse('editAddressOrDescription' + error.toString());
    });
  }





}
