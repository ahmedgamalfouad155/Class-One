import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/admin_tools/presentation/manager/instructors/instructors_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/bottom_sheet/custom_radio_group.dart';

void showInstructorsDialog(BuildContext context, RadioCubit radioCubit) {
  showDialog(
    context: context,
    builder: (_) {
      return BlocProvider.value(
        value: radioCubit,
        child: BlocProvider(
          create: (context) => InstructorsCubit()..getInstructors(),
          child: Builder(
            builder: (context) {
              return AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                backgroundColor: context.appColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: Text(
                  "Instructors",
                  style: AppStyles.textStyle20W600(context),
                ),
                content: SizedBox(
                  width: context.width / 1.3,
                  child: SingleChildScrollView(
                    child: BlocBuilder<InstructorsCubit, InstructorsState>(
                      builder: (context, state) {
                        if (state is InstructorsLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is InstructorsLoadedState) {
                          final List<String> instructors = state.instructors
                              .map((instructor) => instructor.name)
                              .toList();

                          return CustomRadioGroup(options: instructors);
                        }
                        if (state is InstructorsLoadFailureState) {
                          return Text(state.errMessage);
                        } else {
                          return const Text("error");
                        }
                      },
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<RadioCubit>().cancelSelection();
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      "Cancel",
                      style: AppStyles.textStyle16W600(
                        context,
                      ).copyWith(color: context.appColors.blue),
                    ),
                  ),
                  BlocBuilder<RadioCubit, String?>(
                    builder: (context, state) {
                      return TextButton(
                        onPressed: () {
                          context.read<RadioCubit>().confirmSelection();
                          Navigator.of(context).pop(true);
                        },
                        child: Text(
                          "Confirm",
                          style: AppStyles.textStyle16W600(
                            context,
                          ).copyWith(color: context.appColors.blue),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
