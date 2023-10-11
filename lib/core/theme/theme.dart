import 'package:flutter/material.dart';
import 'package:laza/constants.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Colors.white,
    secondary: Color(0xffF5F6FA),
    tertiary: kPrimaryColor,
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color(0xff1B262C),
    primary: Color(0xff29363D),
    secondary: Color(0xff222E34),
    tertiary: Color(0xff1B262C),
  ),
);
