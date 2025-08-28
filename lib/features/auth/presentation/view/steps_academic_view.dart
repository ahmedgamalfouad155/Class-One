import 'package:flutter/material.dart';
import 'package:sinna/features/auth/presentation/view/widgets/steps_acadimic_view_body.dart';

class StepsAcademicView extends StatelessWidget {
  const StepsAcademicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Steps Academic")),
      body: StepsAcadimicViewBody(),
    );
  }
}