import 'package:flutter/material.dart';

import 'package:sinna/core/widgets/custom_buton.dart'; 

class ApplyInfoButtonWidget extends StatelessWidget {
  const ApplyInfoButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.courseTitleController,
    required this.photoUrlController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController courseTitleController;
  final TextEditingController photoUrlController;
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Expanded(child: SizedBox()),
          CustomButton(
            text: "Apply",
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
              // final courseCubit = context.read<CreateCourseCubit>();
              // print("Specialization: ${courseCubit.specialization}");
              // print("Program: ${courseCubit.program}");
              // print("University: ${courseCubit.university}");
              // print("Level: ${courseCubit.level}");
              // print("Course Title: ${courseTitleController.text}");
              // print("Photo URL: ${photoUrlController.text}");
            },
          ),
        ],
      ),
    );
  }
}
