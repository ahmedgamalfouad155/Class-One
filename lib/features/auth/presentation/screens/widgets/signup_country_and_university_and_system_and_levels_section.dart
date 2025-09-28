import 'package:flutter/widgets.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';

class SignupCountryAndUniversityAndSystemAndLevelsFieldsSection
    extends StatelessWidget {
  const SignupCountryAndUniversityAndSystemAndLevelsFieldsSection({
    super.key,
    required this.countryController,
    required this.universityController,
    required this.systemController,
    required this.levelsController,
  });

  final TextEditingController countryController;
  final TextEditingController universityController;
  final TextEditingController systemController;
  final TextEditingController levelsController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Country",
          style: AppStyles.textStyle14W600(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: "Choose your country",
          controller: countryController,
        ),
        const SizedBox(height: 10),
        Text(
          "University",
          style: AppStyles.textStyle14W600(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: "Choose your university",
          controller: universityController,
        ),
        const SizedBox(height: 10),
        Text(
          "System",
          style: AppStyles.textStyle14W600(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: "Choose your system",
          controller: systemController,
        ),
        const SizedBox(height: 10),
        Text(
          "Levels",
          style: AppStyles.textStyle14W600(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: "Choose your levels",
          controller: levelsController,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
