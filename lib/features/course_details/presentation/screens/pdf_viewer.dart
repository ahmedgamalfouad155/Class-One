import 'dart:developer'; 
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  final String pdfUrl;
  const PdfViewerPage({super.key, required this.pdfUrl});

 
Future<void> _downloadFile(BuildContext context) async {
  try {
    // اسم ثابت للملف بدل ما ناخده من اللينك
    const fileName = "course.pdf";

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

    // فتح الملف مباشرة
    await OpenFile.open(filePath);
  } catch (e) {
    log("{$e}");
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("فشل التحميل: $e")),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => _downloadFile(context),
          ),
        ],
      ),
      body: SfPdfViewer.network(pdfUrl),
    );
  }
}
