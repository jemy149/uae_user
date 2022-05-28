import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../router/arguments/user_arguments/delivery_information_screen_args.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_map.dart';
import '../../../widgets/default_text.dart';

class DeliveryInformationScreen extends StatefulWidget {
  final DeliveryInformationScreenArgs deliveryInformationScreenArgs;

  const DeliveryInformationScreen({
    Key? key,
    required this.deliveryInformationScreenArgs,
  }) : super(key: key);

  @override
  State<DeliveryInformationScreen> createState() =>
      _DeliveryInformationScreenState();
}

class _DeliveryInformationScreenState extends State<DeliveryInformationScreen> {
  double? clickedMarkerLat;
  double? clickedMarkerLng;
  final Completer<GoogleMapController> _controller = Completer();




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


            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition:  CameraPosition(
              target: LatLng( widget
                  .deliveryInformationScreenArgs
                  .getOrdersModel
                  .orders[
              widget.deliveryInformationScreenArgs.index]
                  .orderLocation
                  .latitude,
                widget
                    .deliveryInformationScreenArgs
                    .getOrdersModel
                    .orders[
                widget.deliveryInformationScreenArgs.index]
                    .orderLocation
                    .longitude,),
              zoom: 12,
            ),
            markers: {
                    Marker(

                      visible: true,
                        markerId: const MarkerId('orderLocation'),
                        infoWindow: InfoWindow(title: AppLocalizations.of(context)!.orderLocation),
                        position: LatLng(
                          widget
                              .deliveryInformationScreenArgs
                              .getOrdersModel
                              .orders[
                                  widget.deliveryInformationScreenArgs.index]
                              .orderLocation
                              .latitude,
                          widget
                              .deliveryInformationScreenArgs
                              .getOrdersModel
                              .orders[
                                  widget.deliveryInformationScreenArgs.index]
                              .orderLocation
                              .longitude,
                        )),

                  },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                child: Card(
                  color: AppColors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(
                              text: AppLocalizations.of(context)!.orderCost,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white),
                            ),
                            DefaultText(
                              text:
                                  '${widget.deliveryInformationScreenArgs.getOrdersModel.orders[widget.deliveryInformationScreenArgs.index].bill.totalPrice} ${AppLocalizations.of(context)!.appCurrency}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: AppColors.lightGrey),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 10.0),
                          child: Row(
                            children: [
                              Material(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000)),
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Image.asset(
                                      'assets/images/chocolate.png',
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'No Driver',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      DefaultText(
                                        text: 'Delivery Representative',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  color: AppColors.lightBlue,
                                  elevation: 20,
                                  child: const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
