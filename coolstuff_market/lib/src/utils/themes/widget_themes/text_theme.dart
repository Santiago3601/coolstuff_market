import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline3: GoogleFonts.montserrat(fontSize: 40),
    headline2: GoogleFonts.montserrat(fontSize: 30),
    subtitle2: GoogleFonts.montserrat(fontSize: 24),
    bodyText1: GoogleFonts.montserrat(),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline3: GoogleFonts.montserrat(
      color: Colors.white70,
        fontSize: 40
    ),
    headline2: GoogleFonts.montserrat(
      fontSize: 30,
      color: Colors.white70,
    ),
    subtitle2: GoogleFonts.montserrat(color: Colors.white70, fontSize: 24),
    bodyText1: GoogleFonts.montserrat(),
  );
}
