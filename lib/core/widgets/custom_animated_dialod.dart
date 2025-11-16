// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';

enum DialogAnimationType { success, error, warning, info }

class CustomAnimatedDialog {
  static void show({
    required BuildContext context,
    required String message,
    Widget? icon,
    DialogAnimationType animationType = DialogAnimationType.success,
    Duration duration = const Duration(seconds: 2),
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        
        Widget displayedIcon =
            icon ?? _getDefaultIcon(animationType);

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedScale(
                  scale: 1,
                  duration: const Duration(milliseconds: 400),
                  child: displayedIcon,
                ),
                const SizedBox(height: 10),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle18Bold(context),
                ),
              ],
            ),
          ),
        );
      },
    );

    
    Future.delayed(duration, () {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    });
  }

  static Widget _getDefaultIcon(DialogAnimationType type) {
    switch (type) {
      case DialogAnimationType.success:
        return const Icon(Icons.check_circle, color: Colors.green, size: 60);
      case DialogAnimationType.error:
        return const Icon(Icons.error, color: Colors.red, size: 60);
      case DialogAnimationType.warning:
        return const Icon(Icons.warning, color: Colors.orange, size: 60);
      case DialogAnimationType.info:
        return const Icon(Icons.info, color: Colors.blue, size: 60);
    }
  }
}
