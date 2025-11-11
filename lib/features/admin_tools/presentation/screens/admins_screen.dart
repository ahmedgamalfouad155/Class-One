import 'package:flutter/material.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/admins_screen_body.dart';

class AdminsScreen extends StatelessWidget {
  const AdminsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar() ,
      body: AdminsScreenBody(),
    );
  }
}