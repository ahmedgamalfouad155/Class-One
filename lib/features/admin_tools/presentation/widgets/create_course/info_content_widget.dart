import 'package:flutter/material.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_course/apply_info_button_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_course/course_title_and_image_section.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_course/teaching_info_section.dart';

class InfoContentWidget extends StatefulWidget {
  const InfoContentWidget({super.key});

  @override
  State<InfoContentWidget> createState() => _InfoContentWidgetState();
}

class _InfoContentWidgetState extends State<InfoContentWidget> {
  final TextEditingController courseTitleController = TextEditingController();
  final TextEditingController photoUrlController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  dispose() {
    courseTitleController.dispose();
    photoUrlController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) { 
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseTitleAndImageSection(
                    courseTitleController: courseTitleController,
                    photoUrlController: photoUrlController,
                  ),
                  TeachingInfoSection(),
                ],
              ),
            ),
            ApplyInfoButtonWidget(
              formKey: _formKey,
              photoUrlController: photoUrlController,
              courseTitleController: courseTitleController,
            ),
          ],
        ),
      ),
    );
  }
}
