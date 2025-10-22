import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';

class AttachmentsSection extends StatelessWidget {
  const AttachmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "AttachmentsSection",
          style: AppStyles.textStyle16w400Grey(context),
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: Column(
            children: [
              CustomOptionWidget(
                icon: SvgPicture.asset(AppImages.addIcon),
                title: "Add Attachment",
                onTap: () {},
              ),
              CustomDividerWidget(),
              CustomOptionWidget(title: "File Title", onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
