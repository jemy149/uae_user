// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:google_maps_flutter/google_maps_flutter.dart';

String? AppLang = 'En';

String? type;

///////////////////////////////// sharedPreferences constant /////////////////////////////////////////////
String? apiToken;
String? socialToken;
String? googleAccessToken;
String? facebookAccessToken;
String? accountType;
String? tmpToken;

CameraPosition initialCameraPosition = const CameraPosition(
  target: LatLng(24.466667, 54.366669),
  zoom: 7,
);
