import 'package:flutter/material.dart'; 
import 'package:sinna/features/my_courses/presentation/widgets/dashboard_app_bar_widget.dart';
import 'package:sinna/features/my_courses/presentation/widgets/list_of_my_courses_widget.dart'; 

class MyCoursesScreenBody extends StatelessWidget {
  const MyCoursesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
        child: Column(
          children: [
            DashboardAppBarWidget(),
            const SizedBox(height: 10),
            Expanded(child: ListOfMyCoursesWidget()),
          ],
        ),
      ),
    );
  }
}
