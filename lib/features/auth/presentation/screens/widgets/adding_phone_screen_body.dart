import 'package:flutter/material.dart'; 
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/auth/presentation/screens/widgets/phone_field_widget.dart';

class AddingPhoneScreenBody extends StatelessWidget {
  const AddingPhoneScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 30.0,
        left: 30.0,
        // top: AppMedia.height(context) / 5,
        bottom: 32.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add Your Phone", style: AppStyles.textStyle32(context)),
          Text(
            "We’ll use this number for contact and support purpose",
            style: AppStyles.textStyle16w400Grey(context),
          ),
          const SizedBox(height: 32),
          Text("Phone Number", style: AppStyles.textStyle16w400Grey(context)),
          const SizedBox(height: 5),
          PhoneFieldWidget(onChanged: (v) {}),
          const SizedBox(height: 32),
          CustomButton(text: "Next", onPressed: () {}),
        ],
      ),
    );
  }
}
