import 'package:flutter/material.dart';
import 'package:sinna/core/helper/course_video_helper.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/course_details/data/models/attachment_model.dart';

class ListOfAttachmentWidtget extends StatelessWidget {
  const ListOfAttachmentWidtget({super.key, required this.attachmentModel});

  final List<AttachmentModel> attachmentModel;

  @override
  Widget build(BuildContext context) {
    return attachmentModel.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              CustomDividerWidget(isHeight: true),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10,
                ),
                decoration: CustomsBoxDecoration().profileDecoration(context),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final attachmet = attachmentModel[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.insert_drive_file_outlined,
                              color: context.appColors.grey,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              attachmentModel[index].pdfTitle,
                              style: AppStyles.textStyle14W600(context),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () => downloadFile(
                                context,
                                attachmet.pdfUrl,
                                attachmet.pdfTitle,
                              ),
                              child: Icon(
                                Icons.download,
                                color: context.appColors.black,
                                size: 17,
                              ),
                            ),
                          ],
                        ),

                        if (index != attachmentModel.length - 1)
                          const CustomDividerWidget(isHeight: true, height: 20),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(),
                  itemCount: attachmentModel.length,
                ),
              ),
            ],
          );
  }
}
