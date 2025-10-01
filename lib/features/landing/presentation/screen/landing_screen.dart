import 'package:flutter/material.dart';
import 'package:sinna/features/landing/presentation/screen/widgets/landing_screen_body.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LandingScreenBody(),
    );
  }
}