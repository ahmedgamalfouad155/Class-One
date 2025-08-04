import 'package:flutter/material.dart';
import 'package:sinna/features/landing/presentation/views/widgets/landign_view_body.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LandignViewBody(),
    );
  }
}