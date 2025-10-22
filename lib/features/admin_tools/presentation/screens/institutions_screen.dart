import 'package:flutter/material.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/institutions_screen_body.dart';

class InstitutionsScreen extends StatelessWidget {
  const InstitutionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InstitutionsScreenBody(),
    );
  }
}