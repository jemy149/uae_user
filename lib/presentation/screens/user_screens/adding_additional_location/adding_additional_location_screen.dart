import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';

import '../../../../business_logic/user/my_addresses/my_addresses_cubit.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_map.dart';
import '../../../widgets/default_text.dart';
import '../user_addresses/user_addresses_screen.dart';

class AddingAdditionalLocationScreen extends StatefulWidget {
 final MyAddressesCubit myAddressesCubit;
  const AddingAdditionalLocationScreen({Key? key,required this.myAddressesCubit}) : super(key: key);

  @override
  State<AddingAdditionalLocationScreen> createState() => _AddingAdditionalLocationScreenState();
}

class _AddingAdditionalLocationScreenState extends State<AddingAdditionalLocationScreen> {
  late double clickedMarkerLat;
  late double clickedMarkerLng;
  final Completer<GoogleMapController> _controller = Completer();


  @override
  void initState() {
    clickedMarkerLat = 0;
    clickedMarkerLng = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              markers: {
                Marker(
                    markerId:
                    const MarkerId('chosenLocation'),
                    infoWindow: const InfoWindow(
                        title: 'الموقع المختار'),
                    position: LatLng(clickedMarkerLat,
                        clickedMarkerLng)),
              },
              onMapCreated:
                  (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Align(alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 60),
                child: DefaultMaterialButton(
                  text: AppLocalizations.of(context)!.setAddress,
                  onTap: (){Navigator.pop(context);},
                  height: 60,
                  width: 50.w,
                  color: AppColors.lightBlue,
                  textColor: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
