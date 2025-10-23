import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/admin_tools/presentation/manager/create_course_cubit/create_course_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_course/info_content_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_course/lesson_content_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_course/setup_contetn_widget.dart';

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
    return BlocProvider(
      create: (context) => CreateCourseCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Course',
            style: AppStyles.textStyle16W600(context),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: IgnorePointer(
              // ⛔ يمنع الضغط على التابات
              ignoring: true,
              child: TabBar(
                controller: _tabController,
                indicatorColor: context.appColors.blue,
                labelColor: context.appColors.black,
                unselectedLabelColor: context.appColors.grey,
                labelStyle: AppStyles.textStyle16W600(context),
                tabs: const [
                  Tab(text: 'Setup'),
                  Tab(text: 'Info'),
                  Tab(text: 'Lessons'),
                ],
              ),
            ),
          ),
        ),
        body: BlocListener<CreateCourseCubit, CreateCourseState>(
          listener: (context, state) {
            if (state is CreateCourseGoToNextTabState) {
              _tabController.animateTo(state.nextIndex);
            }
          },
          child: TabBarView(
            controller: _tabController,
            // physics: const NeverScrollableScrollPhysics(), // ⛔ يمنع السحب
            children: const [
              SetupContentWidget(),
              InfoContentWidget(),
              LessonsContentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
