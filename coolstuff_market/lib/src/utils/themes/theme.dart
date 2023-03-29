import 'package:coolstuff_market/src/utils/themes/widget_themes/elevated_button_theme.dart';
import 'package:coolstuff_market/src/utils/themes/widget_themes/text_field_theme.dart';
import 'package:coolstuff_market/src/utils/themes/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme{

  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    // elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom())
     elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme:TTextTheme.darkTextTheme ,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme
      // primarySwatch: const MaterialColor(0xFF607d8b, <int, Color>{
      //   50: Color(0x1A607d8b),
      //   100: Color(0x33607d8b),
      //   200: Color(0x4D607d8b),
      //   300: Color(0x66607d8b),
      //   400: Color(0x80607d8b),
      //   500: Color(0xFF607d8b),
      //   600: Color(0xFF607d8b),
      //   700: Color(0x99607d8b),
      //   800: Color(0xB3607d8b),
      //   900: Color(0xCC607d8b),
      // })
  );
}