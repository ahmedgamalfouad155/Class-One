import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_top_shape_in_bottom_sheet.dart';

class TitleInButtomSheetWidget extends StatelessWidget {
  const TitleInButtomSheetWidget({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTopShapeINBottomSheet(),
        const SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: context.appColors.greyBackgroundTextFiled,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close, color: context.appColors.black),
              ),
            ),
            SizedBox(width: context.width / 4),
            Text(title ?? "", style: AppStyles.textStyle17W600(context)),
          ],
        ),
      ],
    );
  }
}
