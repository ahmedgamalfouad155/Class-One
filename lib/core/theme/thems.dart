import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  brightness: Brightness.light,
  useMaterial3: true,
  extensions: const [
    AppColors(
      browen: Color.fromARGB(255, 80, 115, 192),
      blue: Color.fromARGB(255, 0, 110, 255),
      white: Color(0xffFFFFFF),
      offWhite: Color(0xffF3F3F3),
      grey: Color(0xff929292),
      black: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  extensions: const [
    AppColors(
      browen: Color.fromARGB(255, 234, 175, 27),
      blue: Color(0xffFF7A33),
      white: Color.fromARGB(255, 36, 36, 36),
      offWhite: Color(0xff1E1E1E),
      grey: Color(0xff666666),
      black: Color(0xff4CAF50),
    ),
  ],
);
