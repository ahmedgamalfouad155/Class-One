import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';

class TermViewBody extends StatelessWidget {
  const TermViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kInstructorView);
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: const Center(child: Text('first term')),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kInstructorView);
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: const Center(child: Text('second term')),
          ),
        ),
      ],
    );
  }
}
