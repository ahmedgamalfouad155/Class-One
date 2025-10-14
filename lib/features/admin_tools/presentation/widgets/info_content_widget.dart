import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/teaching_info_section.dart';

class InfoContentWidget extends StatelessWidget {
  const InfoContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Course Title",
                  style: AppStyles.textStyle16W600Grey(context),
                ),
                const SizedBox(height: 12),
                CustomTextFieldWidget(
                  hintText: "Introduction to Prosthodontics",
                ),
                CustomDividerWidget(isHeight: true, height: 20),
                const SizedBox(height: 10),
                Text(
                  "Photo URL",
                  style: AppStyles.textStyle16W600Grey(context),
                ),
                const SizedBox(height: 12),
                CustomTextFieldWidget(
                  hintText: "https://example.com/image.jpg",
                ),
                CustomDividerWidget(isHeight: true, height: 20),
                const SizedBox(height: 10),
               TeachingInfoSection(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                CustomButton(text: "Apply", onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
