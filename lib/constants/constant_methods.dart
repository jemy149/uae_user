
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import '../presentation/styles/colors.dart';
import 'enums.dart';

Color getColor(Set<MaterialState> states,Color color) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
  };
  if (states.any(interactiveStates.contains)) {
    return AppColors.lightBlue;
  }
  return color;
}

Future<String> convertPositionToAddress({
  required double lat,
  required double lon,
}) async {
  List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lon);
  Placemark place = placeMarks[0];
  return '${place.street} ${place.locality}';
}



void printResponse(String text) {
  print('\x1B[33m$text\x1B[0m');
}
void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}
void printTest(String text) {
  print('\x1B[32m$text\x1B[0m');
}

 navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void navigateToAndFinish(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) {
      return false;
    },
  );
}
void navigatePushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}



void showToastMsg({required String msg, required ToastStates toastState}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state: toastState),
      textColor: Colors.black,
      fontSize: 16.0);
}



Color chooseToastColor({required ToastStates state}) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}


///////////////////// filtering a list ///////////////////////
findElementInListUsingForLoop(
{required List list,required String element}
    ){
  for(var i = 0; i <list.length;i++){
    if(list[i].name == element){

      return list[i];
    }
  }
}




