import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';

final lightTheme = ThemeData(
  fontFamily: 'cairo',
  scaffoldBackgroundColor: Color(0xffFFFFFF),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    centerTitle: true,
    foregroundColor: Colors.white,
    scrolledUnderElevation: 0,
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
      blue: Color(0xff0088FF),
      white: Color(0xffFFFFFF),
      grey: Color(0xff8b8b8b),
      greyBackground: Color(0xfff2f2f7),
      greyBackgroundTextFiled: Color(0xfff4f4f5),
      greyNavBar: Color(0xffb2b2b2),
      greyMoonlight: Color(0xffeeeeef),
      black: Color(0xff000000),
      red: Color(0xffFF0000),
    ),
  ],
);

final darkTheme = ThemeData(
  fontFamily: 'cairo',
  scaffoldBackgroundColor: Color(0xff1c1c1e),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color(0xff1c1c1e),
    centerTitle: true,
    foregroundColor: Color(0xff1c1c1e),
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      color: Color(0xff1c1c1e),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  brightness: Brightness.dark,
  useMaterial3: true,
  extensions: const [
    AppColors(
      blue: Color(0xff0088FF),
      white: Color(0xff1c1c1e),
      grey: Color(0xff98989f),
      greyBackground: Color(0xff2c2c30),
      greyBackgroundTextFiled: Color(0xff2c2c30),
      greyNavBar: Color(0xff68686a),
      greyMoonlight: Color(0xff2c2c30),
      black: Color(0xffFFFFFF),
      red: Color(0xffFF0000),
    ),
  ],
);
