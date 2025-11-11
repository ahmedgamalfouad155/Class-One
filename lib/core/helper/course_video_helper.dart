import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

void exitFullScreen() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future<void> downloadFile(
  BuildContext context,
  String pdfUrl,
  String pdfTitle,
) async {
  try {
    final fileName = "$pdfTitle.pdf";

    // مجلد خارجي للتطبيق (يظهر في ملفات المستخدم)
    final dir = await getExternalStorageDirectory();
    final filePath = "${dir!.path}/$fileName";

    // تحميل الملف
    await Dio().download(pdfUrl, filePath);

    // رسالة نجاح
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("تم تحميل الملف في مجلد التطبيق")),
    );
  } catch (e) {
    ScaffoldMessenger.of(
      // ignore: use_build_context_synchronously
      context,
    ).showSnackBar(SnackBar(content: Text("فشل التحميل: $e")));
  }
}
