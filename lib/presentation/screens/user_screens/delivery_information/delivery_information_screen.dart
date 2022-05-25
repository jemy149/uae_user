import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uae_user/presentation/views/delivery_information_card_item.dart';

import '../../../../constants/constants.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_map.dart';
import '../../../widgets/default_text.dart';

class DeliveryInformationScreen extends StatefulWidget {
  const DeliveryInformationScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryInformationScreen> createState() => _DeliveryInformationScreenState();
}

class _DeliveryInformationScreenState extends State<DeliveryInformationScreen> {
  double? clickedMarkerLat;
  double? clickedMarkerLng;
  final Completer<GoogleMapController> _controller = Completer();
  late bool isSent;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
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
                      text: AppLocalizations.of(context)!.deliveryInformation,
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
              Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
                  child: DeliveryInformationCardItem(),
                ),
              ],
            )],
          ),
    ));
  }
}
