import 'package:flutter/material.dart';

extension AppColorHelper on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

@immutable
class AppColors extends ThemeExtension<AppColors> { 
  final Color blue;
  final Color white; 
  final Color grey;
  final Color greyBackground;
  final Color greyBackgroundTextFiled;
  final Color greyNavBar;
  final Color greyMoonlight;
  final Color black;
  final Color red;

  const AppColors({ 
    required this.blue,
    required this.white, 
    required this.grey,
    required this.greyBackground,
    required this.greyBackgroundTextFiled,
    required this.greyNavBar,
    required this.greyMoonlight,
    required this.black,
    required this.red,
  });

  @override
  AppColors copyWith({
    Color? primaryBlue,
    Color? blue,
    Color? white,
    Color? offWhite,
    Color? grey,
    Color? greyBackground,
    Color? greyBackgroundTextFiled,
    Color? greyNavBar,
    Color? greyMoonlight,
    Color? black,
    Color? red,
  }) {
    return AppColors( 
      blue: blue ?? this.blue,
      white: white ?? this.white, 
      grey: grey ?? this.grey,
      greyBackground: greyBackground ?? this.greyBackground,
      greyBackgroundTextFiled:
          greyBackgroundTextFiled ?? this.greyBackgroundTextFiled,
      greyNavBar: greyNavBar ?? this.greyNavBar,
      greyMoonlight: greyMoonlight ?? this.greyMoonlight,
      black: black ?? this.black,
      red: red ?? this.red,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors( 
      blue: Color.lerp(blue, other.blue, t)!,
      white: Color.lerp(white, other.white, t)!, 
      grey: Color.lerp(grey, other.grey, t)!,
      greyBackground: Color.lerp(greyBackground, other.greyBackground, t)!,
      greyBackgroundTextFiled: Color.lerp(
        greyBackgroundTextFiled,
        other.greyBackgroundTextFiled,
        t,
      )!,
      greyNavBar: Color.lerp(greyNavBar, other.greyNavBar, t)!,
      greyMoonlight: Color.lerp(greyMoonlight, other.greyMoonlight, t)!,
      black: Color.lerp(black, other.black, t)!,
      red: Color.lerp(red, other.red, t)!,
    );
  }
}
