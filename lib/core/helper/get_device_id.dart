
import 'dart:io'; 
import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceId() async {
  String deviceId;
  final deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id;
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    deviceId = iosInfo.identifierForVendor ?? 'Unknown';
  } else {
    deviceId = 'Unsupported platform';
  }
  return deviceId;
}
