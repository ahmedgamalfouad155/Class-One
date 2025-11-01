import 'package:flutter/material.dart';
import 'package:sinna/features/profile/presentation/widgets/preferences_screen_body.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:PreferencesScreenBody(),
    );
  }
}