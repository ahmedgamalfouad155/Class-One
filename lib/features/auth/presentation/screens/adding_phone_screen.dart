import 'package:flutter/material.dart'; 
import 'package:sinna/features/auth/presentation/screens/widgets/adding_phone_screen_body.dart';

class AddingPhoneScreen extends StatelessWidget {
  const AddingPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: AddingPhoneScreenBody());
  }
}
