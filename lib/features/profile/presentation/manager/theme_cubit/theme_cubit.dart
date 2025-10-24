import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sinna/core/constants/constants.dart'; 



class ThemeCubit extends Cubit<ThemeMode> {
  static const String _boxName = AppConstants.hiveBoxName;
  static const String _themeKey = 'themeMode';

  ThemeCubit() : super(ThemeMode.light);

  /// فتح Hive Box وتحميل الثيم المحفوظ
  Future<void> loadTheme() async {
    final box = await Hive.openBox(_boxName);
    final savedTheme = box.get(_themeKey, defaultValue: 'light');

    if (savedTheme == 'dark') {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }

  /// تغيير الثيم وحفظه في Hive
  Future<void> toggleTheme(bool isDark) async {
    final box = await Hive.openBox(_boxName);
    final newTheme = isDark ? ThemeMode.dark : ThemeMode.light;

    emit(newTheme);
    await box.put(_themeKey, isDark ? 'dark' : 'light');
  }

  bool get isDark => state == ThemeMode.dark;
}
