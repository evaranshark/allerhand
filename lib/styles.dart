import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStyles {
  static get dialogTitleTextStyle => GoogleFonts.playfairDisplay(
        fontSize: 40,
        fontWeight: FontWeight.w700,
      );
  static get mainTitleTextStyle => GoogleFonts.playfairDisplay(
        fontSize: 70,
        fontWeight: FontWeight.w700,
      );

  static get mainSubitleTextStyle => GoogleFonts.playfairDisplay(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );
  static get mainContentTextStyle => GoogleFonts.montserrat(
        fontSize: 32,
        fontWeight: FontWeight.w400,
      );

  static get dialogContentTextStyle => GoogleFonts.montserrat(
        fontSize: 30,
        fontWeight: FontWeight.w400,
      );
  static get buttonTextStyle => GoogleFonts.montserrat(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      );
}
