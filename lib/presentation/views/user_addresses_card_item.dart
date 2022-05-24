import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_user/data/models/shared_models/shared_classes/api_address.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/second_default_form_field.dart';

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
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    latLng = LatLng(widget.myAddress.latitude.toDouble(),
        widget.myAddress.longitude.toDouble());
    initialCameraPosition = CameraPosition(
      target: latLng,
      zoom: 8,
    );
    addressController.text = widget.myAddress.address;
    descriptionController.text = widget.myAddress.description;
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
            SecondDefaultFormField(
              onEditingComplete: () {
                if (addressController.text != widget.myAddress.address ||
                    descriptionController.text !=
                        widget.myAddress.description) {
                  widget.myAddressesCubit.editAddressOrDescription(
                      locationId: widget.myAddress.id,
                      locationLongitude: widget.myAddress.longitude,
                      locationLatitude: widget.myAddress.latitude,
                      locationAddress: addressController.text,
                      description: descriptionController.text,
                      isDefaultAddress: widget.myAddress.isDefult,
                      index: widget.index);

                }
                FocusScope.of(context).unfocus();

              },
              verticalPadding: 8,
              inputEnabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              inputFocusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.blue),
              ),
              maxLines: 1,
              controller: addressController,
              keyboardType: TextInputType.text,
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(
                    end: 15.0, bottom: 5.0, top: 5.0, start: 5),
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
              ),
            ),
            SecondDefaultFormField(
                onEditingComplete: () {
                  if (addressController.text != widget.myAddress.address ||
                      descriptionController.text !=
                          widget.myAddress.description) {
                    widget.myAddressesCubit.editAddressOrDescription(
                        locationId: widget.myAddress.id,
                        locationLongitude: widget.myAddress.longitude,
                        locationLatitude: widget.myAddress.latitude,
                        locationAddress: addressController.text,
                        description: descriptionController.text,
                        isDefaultAddress: widget.myAddress.isDefult,
                        index: widget.index);
                  }
                  FocusScope.of(context).unfocus();

                },
                verticalPadding: 8,
                inputEnabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                inputFocusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blue),
                ),
                hintText: AppLocalizations.of(context)!.addDescription,
                maxLines: 1,
                controller: descriptionController,
                keyboardType: TextInputType.text),
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
