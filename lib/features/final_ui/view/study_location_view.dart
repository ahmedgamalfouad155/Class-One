import 'package:flutter/material.dart';
import 'package:sinna/features/final_ui/widgets/study_location_view_body.dart';

class StudyLocationView extends StatelessWidget {
  const StudyLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StudyLocationViewBody(),
    );
  }
}