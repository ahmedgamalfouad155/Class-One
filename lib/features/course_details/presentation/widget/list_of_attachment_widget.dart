import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';

class ListOfAttachmentWidtget extends StatelessWidget {
  const ListOfAttachmentWidtget({
    super.key,
    required this.pdfTitle,
    required this.pdfUrl,
  });

  final String pdfTitle, pdfUrl;
  Future<void> _downloadFile(BuildContext context) async {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      decoration: CustomsBoxDecoration().profileDecoration(context),
      child: Row(
        children: [
          Icon(Icons.insert_drive_file_outlined, color: context.appColors.grey),
          const SizedBox(width: 10),
          Text(pdfTitle, style: AppStyles.textStyle14W600(context)),
          Spacer(),
          InkWell(
            onTap: () => _downloadFile(context),
            child: Icon(
              Icons.download,
              color: context.appColors.black,
              size: 17,
            ),
          ),
        ],
      ),
    );
  }
}
