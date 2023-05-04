import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

void flutterToast(String message, status) {
  if(status==("ok")) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,

      backgroundColor: Color(0x80000000),
      textColor: Color(0xFFFFFFFF),
    );
  }else{
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,

      backgroundColor: Color(0x80FF0000),
      textColor: Color(0xFFFFFFFF),
    );
  }
}