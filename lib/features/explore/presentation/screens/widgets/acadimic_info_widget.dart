import 'package:flutter/material.dart'; 
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/explore/presentation/screens/widgets/academic_info_dialog.dart';

class AcadimicInfoWidget extends StatelessWidget {
  const AcadimicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Academic Info',
          style: AppStyles.textStyle16W600(
            context,
          ).copyWith(color: context.appColors.grey),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () => showAcademicInfoDialog(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'University',
                style: AppStyles.textStyle16w400Grey(
                  context,
                ).copyWith(color: context.appColors.black),
              ),
              Row(
                children: [
                  Text( 
                    'Select University',
                    style: AppStyles.textStyle14W600(context),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.arrow_drop_down_sharp),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
