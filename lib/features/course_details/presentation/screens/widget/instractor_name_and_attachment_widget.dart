import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/course_details/presentation/screens/pdf_viewer.dart';

class InstractorNameAndAttachmentWidget extends StatelessWidget {
  const InstractorNameAndAttachmentWidget({
    super.key,
    required this.instractorName,
    required this.attachmentUrl,
  });
  final String instractorName;
  final String attachmentUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "UX Design in Practice: Accessibility and Collaboration",
            style: AppStyles.textStyle22Bold(context),
          ),
          CustomDividerWidget(isHeight: true),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Instructor",
                style: AppStyles.textStyle16W600Grey(context),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    child: Icon(Icons.person, color: context.appColors.black),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    instractorName,
                    style: AppStyles.textStyle16W600(context),
                  ),
                ],
              ),
            ],
          ),
          CustomDividerWidget(isHeight: true),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewerPage(pdfUrl: attachmentUrl),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Attachment",
                  style: AppStyles.textStyle16W600Grey(context),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Supporting Materials",
                            style: AppStyles.textStyle14W600(context),
                          ),
                          Text(
                            "Download the notes before watching the video",
                            style: AppStyles.textStyle14W600(context).copyWith(
                              color: context.appColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: context.appColors.greyMoonlight,
                      child: Icon(
                        Icons.more_horiz,
                        color: context.appColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
