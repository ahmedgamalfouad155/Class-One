import 'package:flutter/material.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/participants_screen_body.dart';

class ParticipantsScreen extends StatelessWidget {
  const ParticipantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: ParticipantsScreenBody());
  }
}
