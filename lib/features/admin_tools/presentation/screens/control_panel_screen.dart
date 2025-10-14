import 'package:flutter/material.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/control_panel_screen_body.dart';

class ControlPanelScreen extends StatelessWidget {
  const ControlPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ControlPanelScreenBody(),
    );
  }
}
