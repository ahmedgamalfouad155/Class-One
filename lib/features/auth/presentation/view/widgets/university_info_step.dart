import 'package:flutter/material.dart';
import 'package:sinna/features/auth/presentation/view/widgets/steps_section_widget.dart';

class UniversityInfoStep extends StatelessWidget {
  const UniversityInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [StepsSectionWidget()],
      ),
    );
  }
}
