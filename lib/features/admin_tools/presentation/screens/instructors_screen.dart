import 'package:flutter/material.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/instructors/instructors_screen_body.dart';

class InstructorsScreen extends StatelessWidget {
  const InstructorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: InstructorsScreenBody());
  }
}
