import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/course_details/presentation/widget/add_attachment_dialog_widget.dart';
import 'package:sinna/features/course_details/presentation/widget/list_of_attachment_bottom_sheet_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

void attachmentsBottomSheet(
  BuildContext context,
  CoursePathModel coursePathModel,
  CourseModel course,
) {
  CustomBottomSheet.show(
    context: context,
    child: SizedBox(
      height: context.height * 0.9,
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TitleInButtomSheetWidget(title: LocaleKeys.attachments.tr()),
              Spacer(),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AddingAttachmentDialogWidget(
                      course: course,
                      coursePathModel: coursePathModel,
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: context.appColors.blue,
                  child: Icon(Icons.add, color: context.appColors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListOfAttachmentBottomSheetWidget(
              course: course,
              coursePathModel: coursePathModel,
            ),
          ),
        ],
      ),
    ),
  );
}
