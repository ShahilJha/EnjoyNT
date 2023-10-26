import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData kLightTheme = ThemeData(
  scaffoldBackgroundColor: kScaffoldBackgroundColor,
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: kBackgroundInactiveColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: kBackgroundInactiveColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    background: kScaffoldBackgroundColor,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: kBackgroundInactiveColor),
    titleTextStyle: TextStyle(color: Colors.black),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    textTheme: ButtonTextTheme.primary,
  ),
  dividerTheme: const DividerThemeData(
    space: 10,
    thickness: 1,
    indent: 5,
    endIndent: 5,
    color: kBackgroundInactiveColor,
  ),
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(color: kPrimaryColor),
    checkColor: MaterialStateProperty.all<Color>(kWhiteColor),
    fillColor: MaterialStateProperty.all<Color>(kPrimaryColor),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kWidgetBackgroundColor,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
    ),
    hintStyle: TextStyle(
      color: kBackgroundInactiveColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelStyle: TextStyle(
      color: kBackgroundInactiveColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);
