import 'package:flutter/services.dart';
import 'package:screen_protector/screen_protector.dart';

class ScreenProtectorService {
  static Future<void> preventScreenshots() async {
    await ScreenProtector.preventScreenshotOn();
  }

  static Future<void> setPreferredOrientations() async {
    
   await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  }
}
