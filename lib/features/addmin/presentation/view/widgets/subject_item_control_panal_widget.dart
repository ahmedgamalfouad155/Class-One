import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/addmin/presentation/manager/control_panal_cubit/control_panal_cubit.dart';

class SubjectItemControlPanalWidget extends StatelessWidget {
  const SubjectItemControlPanalWidget({
    super.key,
    required this.onTap,
    required this.coursePath,
    required this.email,
  });

  final void Function() onTap;
  final CoursePathModel coursePath;
  final String email;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: CustomsBoxDecoration().defaultBoxDecoration(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(AppImages.logo),
            ),
            Text(
              coursePath.subjectName.toString(),
              style: AppStyles.textStyle16(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  coursePath.stage.toString(),
                  style: AppStyles.textStyle12(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.appColors.blue,
                  ),
                ),
                Text(
                  coursePath.term.toString(),
                  style: AppStyles.textStyle12(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.appColors.blue,
                  ),
                ),
              ],
            ),
            Text(
              coursePath.subjectDoctor.toString(),
              style: AppStyles.textStyle12(context).copyWith(
                fontWeight: FontWeight.bold,
                color: context.appColors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Active",
                  style: AppStyles.textStyle14(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                SwitchWidget(
                  isPaid: coursePath.isPaid!,
                  email: email,
                  id: coursePath.id.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SwitchWidget extends StatefulWidget {
  SwitchWidget({
    super.key,
    required this.isPaid,
    required this.email,
    required this.id,
  });

  bool isPaid;
  final String email;
  final String id;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .7,
      child: Switch(
        value: widget.isPaid,
        onChanged: (value) {
          setState(() {
            widget.isPaid = value;
            context.read<ControlPanalCubit>().editUserPaid(
              email: widget.email,
              isPaid: value,
              id: widget.id,
            );
          }); 
        },
      ),
    );
  }
}
