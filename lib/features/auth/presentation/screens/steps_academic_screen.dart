import 'package:flutter/material.dart';
import 'package:sinna/features/auth/presentation/screens/widgets/steps_acadimic_screen_body.dart';

class StepsAcademicScreen extends StatelessWidget {
  const StepsAcademicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Steps Academic")),
      body: StepsAcadimicScreenBody(),
    );
  }
}
