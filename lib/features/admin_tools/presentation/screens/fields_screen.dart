import 'package:flutter/material.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/fields_screen_body.dart';

class FildsScreen extends StatelessWidget {
  const FildsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: FieldsScreenBody()));
  }
}
