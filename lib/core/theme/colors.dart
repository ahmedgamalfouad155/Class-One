import 'package:flutter/material.dart';

extension AppColorHelper on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color primaryBlue;
  final Color blue;
  final Color white;
  final Color offWhite;
  final Color grey;
  final Color grayBackground;
  final Color grayBackgroundTextFiled;
  final Color grayNavBar;
  final Color black;

  const AppColors({
    required this.primaryBlue,
    required this.blue,
    required this.white,
    required this.offWhite,
    required this.grey,
    required this.grayBackground,
    required this.grayBackgroundTextFiled,
    required this.grayNavBar,
    required this.black,
  });

  @override
  AppColors copyWith({
    Color? primaryBlue,
    Color? blue,
    Color? white,
    Color? offWhite,
    Color? grey,
    Color? grayBackground,
    Color? grayBackgroundTextFiled,
    Color? grayNavBar,
    Color? black,
  }) {
    return AppColors(
      primaryBlue: primaryBlue ?? this.primaryBlue,
      blue: blue ?? this.blue,
      white: white ?? this.white,
      offWhite: offWhite ?? this.offWhite,
      grey: grey ?? this.grey,
      grayBackground: grayBackground ?? this.grayBackground,
      grayBackgroundTextFiled:
          grayBackgroundTextFiled ?? this.grayBackgroundTextFiled,
          grayNavBar: grayNavBar ?? this.grayNavBar,
      black: black ?? this.black,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primaryBlue: Color.lerp(primaryBlue, other.primaryBlue, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      white: Color.lerp(white, other.white, t)!,
      offWhite: Color.lerp(offWhite, other.offWhite, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      grayBackground: Color.lerp(grayBackground, other.grayBackground, t)!,
      grayBackgroundTextFiled: Color.lerp(
        grayBackgroundTextFiled,
        other.grayBackgroundTextFiled,
        t,
      )!,
      grayNavBar: Color.lerp(grayNavBar, other.grayNavBar, t)!,
      black: Color.lerp(black, other.black, t)!,
    );
  }
}
