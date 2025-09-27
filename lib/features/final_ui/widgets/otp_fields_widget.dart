import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/utils/app_media.dart';

class OtpFieldWidget extends StatefulWidget {
  final int length;
  final Function(String)? onCompleted;

  const OtpFieldWidget({
    super.key,
    this.length = 6, // عدد الخانات الافتراضي
    this.onCompleted,
  });

  @override
  State<OtpFieldWidget> createState() => _OtpFieldWidgetState();
}

class _OtpFieldWidgetState extends State<OtpFieldWidget> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      // لو كتب رقم → روح للفيلد اللي بعده
      if (index + 1 < widget.length) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else {
      // لو مسح رقم → ارجع للفيلد اللي قبله
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }

    // لو كل الخانات اتملت → رجّع الكود كامل
    final otp = _controllers.map((e) => e.text).join();
    if (otp.length == widget.length) {
      widget.onCompleted?.call(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: AppMedia.width(context) / 9,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              counterText: "", // يخفي عداد الأحرف
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: context.appColors.offWhite,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: context.appColors.blue, width: 2),
              ),
            ),
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    );
  }
}
