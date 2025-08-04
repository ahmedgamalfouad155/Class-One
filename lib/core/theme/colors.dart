import 'package:flutter/material.dart';

extension AppColorHelper on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color browen;
  final Color blue;
  final Color white;
  final Color offWhite;
  final Color grey;
  final Color black;

  const AppColors({
    required this.browen,
    required this.blue,
    required this.white,
    required this.offWhite,
    required this.grey,
    required this.black,
  });

  @override
  AppColors copyWith({
    Color? browen,
    Color? blue,
    Color? white,
    Color? offWhite,
    Color? grey,
    Color? black,
  }) {
    return AppColors(
      browen: browen ?? this.browen,
      blue: blue ?? this.blue,
      white: white ?? this.white,
      offWhite: offWhite ?? this.offWhite,
      grey: grey ?? this.grey,
      black: black ?? this.black,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      browen: Color.lerp(browen, other.browen, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      white: Color.lerp(white, other.white, t)!,
      offWhite: Color.lerp(offWhite, other.offWhite, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      black: Color.lerp(black, other.black, t)!,
    );
  }
}
