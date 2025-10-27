import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/my_courses/presentation/widgets/list_of_my_courses_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class MyCoursesScreenBody extends StatelessWidget {
  const MyCoursesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: Column(
            children: [
              CustomTextFieldWidget(
                hintText: LocaleKeys.search.tr(),
                icon: Icon(Icons.search, color: context.appColors.greyNavBar),
              ),
              const SizedBox(height: 10), 
              ListOfMyCoursesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
