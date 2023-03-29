import 'package:coolstuff_market/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();
  static ElevatedButtonThemeData lightElevatedButtonTheme =
   ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(tAccentColor) ,
    ),
  );
  static ElevatedButtonThemeData darkElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(tAccentColor) ,
    ),
  );

}
