// ignore_for_file: file_names 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_course/show_instructors_dialog.dart';

class InstructorsInfoSection extends StatelessWidget {
  const InstructorsInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RadioCubit>(), 
      child: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Instructor", style: AppStyles.textStyle16w400Grey(context)),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: CustomsBoxDecoration().profileDecoration(context),
                child: InkWell(
                  onTap: () => showInstructorsDialog(
                    context,
                    context.read<RadioCubit>(),
                  ),
                  //
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Instructor',
                        style: AppStyles.textStyle16w400Grey(
                          context,
                        ).copyWith(color: context.appColors.black),
                      ),
                      Row(
                        children: [
                          BlocBuilder<RadioCubit, String?>(
                            builder: (context, state) {
                              return Text(
                                state ?? "Select Instructor",
                                style: AppStyles.textStyle14W600(context),
                              );
                            },
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.arrow_drop_down_sharp),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
