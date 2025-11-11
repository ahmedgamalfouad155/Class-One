import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/widgets/custom_profile_avatar.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/presentation/widgets/create_course_bottom_sheet.dart';

class DiscoverAppBarWidget extends StatelessWidget {
  const DiscoverAppBarWidget({super.key, required this.path});
  final CoursePathModel path;

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthCubit>().emailAdmin;
    return Row(
      children: [
        Icon(Icons.search),
        Spacer(),
        isAdmin
            ? Row(
                children: [
                  InkWell(
                    onTap: () => createCourseBottomSheet(context, path),
                    child: Icon(Icons.video_call_outlined),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kControlPanalScreen);
                    },
                    child: Icon(Icons.settings_outlined),
                  ),
                ],
              )
            : const SizedBox(),
        const SizedBox(width: 10),
        CustomProfileAvatar(),
      ],
    );
  }
}
