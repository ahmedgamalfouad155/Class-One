import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';

final lightTheme = ThemeData(
  fontFamily: 'cairo',
  scaffoldBackgroundColor: Color(0xffF3F3F3),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 23, 32, 66),
    centerTitle: true,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  brightness: Brightness.light,
  useMaterial3: true,
  extensions: const [
    AppColors(
      primaryBlue: Color.fromARGB(255, 38, 54, 110),
      blue: Color.fromARGB(255, 2, 35, 76),
      white: Color(0xffFFFFFF),
      offWhite: Color(0xffF3F3F3),
      grey: Color.fromARGB(255, 125, 128, 131),
      black: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);

final darkTheme = ThemeData(
  fontFamily: 'cairo',
  brightness: Brightness.dark,
  useMaterial3: true,
  extensions: const [
    AppColors(
      primaryBlue: Color.fromARGB(255, 234, 175, 27),
      blue: Color(0xffFF7A33),
      white: Color.fromARGB(255, 36, 36, 36),
      offWhite: Color(0xff1E1E1E),
      grey: Color(0xff666666),
      black: Color(0xff4CAF50),
    ),
  ],
);
