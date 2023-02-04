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
  static get pageTitleTextStyle =>
      GoogleFonts.playfairDisplay(fontWeight: FontWeight.w700, fontSize: 64);
  static get pageSubtitleTextStyle =>
      GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600, fontSize: 48);
  static get mapContentTextStyle => GoogleFonts.montserrat(
        fontSize: 30,
        fontWeight: FontWeight.w400,
      );
  static get iconTextStyle => GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: primaryColor,
      );
  static get mapModalTitleTextStyle => GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
        fontSize: 26,
      );
  static get personButtonTextStyle => GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
  static get personModalNameTextStyle => GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
  static get personPositionTextStyle => GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: const Color.fromARGB(255, 123, 123, 123),
      );
  static get primaryColor => const Color.fromARGB(255, 46, 64, 131);
}
