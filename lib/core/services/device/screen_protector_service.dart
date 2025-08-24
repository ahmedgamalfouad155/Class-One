import 'package:screen_protector/screen_protector.dart';

class ScreenProtectorService {
  static Future<void> preventScreenshots() async {
    await ScreenProtector.preventScreenshotOn();
  }
}
