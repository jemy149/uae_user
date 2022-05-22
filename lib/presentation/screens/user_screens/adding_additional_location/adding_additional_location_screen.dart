import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/constants/enums.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';

import '../../../../business_logic/user/add_address/add_address_cubit.dart';
import '../../../../business_logic/user/my_addresses/my_addresses_cubit.dart';
import '../../../../constants/constants.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_map.dart';
import '../../../widgets/default_text.dart';

class AddingAdditionalLocationScreen extends StatefulWidget {
  final MyAddressesCubit myAddressesCubit;

  const AddingAdditionalLocationScreen(
      {Key? key, required this.myAddressesCubit})
      : super(key: key);

  @override
  State<AddingAdditionalLocationScreen> createState() =>
      _AddingAdditionalLocationScreenState();
}

class _AddingAdditionalLocationScreenState
    extends State<AddingAdditionalLocationScreen> {
  double? clickedMarkerLat;
  double? clickedMarkerLng;
  final Completer<GoogleMapController> _controller = Completer();
  late bool isSent;


  @override
  void initState() {
    isSent=false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AddAddressCubit(),
        child: BlocListener<AddAddressCubit, AddAddressState>(
          listener: (context, state) {
            if (state is UserAddAddressSuccessState) {
              showToastMsg(msg:state.message , toastState: ToastStates.SUCCESS);
              widget.myAddressesCubit.getMyAddresses();
              Navigator.pop(context);
            } else if (state is UserAddAddressErrorState){
              showToastMsg(msg: state.message, toastState: ToastStates.ERROR);

            }
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.lightBlue,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsetsDirectional.only(end: 60),
                      child: DefaultText(
                        text: AppLocalizations.of(context)!.location,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontFamily: 'Bukra-Regular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      )),
                ],
              ),
            ),
            body: Stack(
              children: [
                DefaultMap(
                  onTap: (argument) {
                    setState(() {
                      clickedMarkerLat = argument.latitude;
                      clickedMarkerLng = argument.longitude;
                    });
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: initialCameraPosition,
                  markers: clickedMarkerLat == null || clickedMarkerLng == null
                      ? const {}
                      : {
                          Marker(
                              markerId: const MarkerId('chosenLocation'),
                              infoWindow:
                                  const InfoWindow(title: 'الموقع المختار'),
                              position:
                                  LatLng(clickedMarkerLat!, clickedMarkerLng!)),
                        },
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 60),
                    child: Builder(
                      builder: (context) {
                        return DefaultMaterialButton(
                          text: AppLocalizations.of(context)!.setAddress,
                          onTap: () {
                            if (!isSent) {
                              if (clickedMarkerLat != null &&
                                  clickedMarkerLng != null) {
                                isSent=true;
                                AddAddressCubit.get(context).addAddress(
                                  locationLongitude: clickedMarkerLng!,
                                  locationLatitude: clickedMarkerLat!,
                                );
                              } else {
                                showToastMsg(
                                    msg: AppLocalizations.of(context)!.pickLocation,
                                    toastState: ToastStates.ERROR);
                              }
                            }
                          },
                          height: 60,
                          width: 50.w,
                          color: AppColors.lightBlue,
                          textColor: Colors.white,
                          fontSize: 18,
                        );
                      }
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
