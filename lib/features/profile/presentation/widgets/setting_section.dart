import 'package:flutter/material.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart'; 
import 'package:sinna/features/profile/presentation/widgets/dialog_and_bottom_sheet_fun/appearance_content_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/dialog_and_bottom_sheet_fun/language_content_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/profile_option_widget.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Settings", style: AppStyles.textStyle16w400Grey(context)),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: Column(
            children: [
              ProfileOptionWidget(
                title: "Language",
                onTap: () => languageContentBottomSheet(context),
              ),
              CustomDividerWidget(isHeight: false),
              ProfileOptionWidget(
                title: "Appearance",
                onTap: () => appearanceContentBottomSheet(context),
              ),
              CustomDividerWidget(isHeight: false),
              ProfileOptionWidget(
                title: "Notifications",
                verticalPading: 0,
                widget: Transform.scale(
                  scale: .7,
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                    focusColor: Colors.white,
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.red,
                    activeTrackColor: Colors.green,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
