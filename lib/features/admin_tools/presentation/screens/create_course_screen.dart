import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/info_content_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/lesson_content_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/setup_contetn_widget.dart';

class CreateCourseScreen extends StatefulWidget {
  const CreateCourseScreen({super.key});

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Course', style: AppStyles.textStyle16W600(context)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: TabBar(
            controller: _tabController,
            indicatorColor: context.appColors.blue,
            labelColor: context.appColors.black,
            unselectedLabelColor: context.appColors.grey,
            labelStyle: AppStyles.textStyle16W600(context),
            tabs: const [
              Tab(text: 'Info'),
              Tab(text: 'Setup'),
              Tab(text: 'Lessons'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          InfoContentWidget(),
          SetupContentWidget(),
          LessonsContentWidget(),
        ],
      ),
    );
  }
}
