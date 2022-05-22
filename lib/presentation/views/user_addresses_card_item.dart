import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_user/data/models/shared_models/shared_classes/api_address.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

import '../../business_logic/user/my_addresses/my_addresses_cubit.dart';
import '../widgets/default_map.dart';

class UserAddressesCardItem extends StatefulWidget {
  final ApiAddress myAddress;
  final MyAddressesCubit myAddressesCubit;
  final int index;

  const UserAddressesCardItem(
      {Key? key,
      required this.myAddress,
      required this.myAddressesCubit,
      required this.index})
      : super(key: key);

  @override
  State<UserAddressesCardItem> createState() => _UserAddressesCardItemState();
}

class _UserAddressesCardItemState extends State<UserAddressesCardItem> {
  late CameraPosition initialCameraPosition;
  late LatLng latLng;

  @override
  void initState() {
    latLng = LatLng(widget.myAddress.latitude.toDouble(),
        widget.myAddress.longitude.toDouble());
    initialCameraPosition = CameraPosition(
      target: latLng,
      zoom: 8,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 10.0, top: 5.0, bottom: 5.0),
                  child: DefaultText(
                    text: widget.myAddress.address,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      end: 15.0, bottom: 5.0, top: 5.0),
                  child: InkWell(
                    onTap: () {
                      widget.myAddressesCubit.deleteAddress(
                          locationId: widget.myAddress.id, index: widget.index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.red)),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              color: AppColors.grey,
              height: 1,
              width: double.maxFinite,
            ),
            SizedBox(
              height: 30.h,
              child: DefaultMap(
                liteModeEnabled: true,
                scrollGesturesEnabled: false,
                tiltGesturesEnabled: false,
                rotateGesturesEnabled: false,
                initialCameraPosition: initialCameraPosition,
                markers: {
                  Marker(
                      markerId: const MarkerId('chosenLocation'),
                      infoWindow: const InfoWindow(
                        title: 'العنوان',
                      ),
                      position: latLng),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
