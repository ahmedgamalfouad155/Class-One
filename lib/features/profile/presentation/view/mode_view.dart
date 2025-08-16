import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/profile/presentation/view/widgets/mode_view_body.dart';

class ModeView extends StatelessWidget {
  const ModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.primaryBlue,
      appBar: AppBar(title: const Text('Appearance')),
      body: ModeViewBody(),
    );
  }
}
