import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/data/steps_data.dart';
import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_state.dart';
import 'package:sinna/features/auth/presentation/view/widgets/custom_drop_down_widget.dart';
import 'package:sinna/features/addmin/presentation/manager/account_cubit/account_cubit.dart';
import 'package:timelines_plus/timelines_plus.dart';

class AccountStepsSectionWidget extends StatelessWidget {
  const AccountStepsSectionWidget({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<StepsCubit>();
    return BlocBuilder<StepsCubit, StepsState>(
      bloc: cubit,
      builder: (context, state) {
        final steps = <Widget>[
          // Country
          CustomDropdownWidget(
            items: StepsData.universities.keys.toList(),
            selectedValue: state.country,
            hintText: "Select Country",
            onChanged: (val) {
              cubit.selectCountry(val!);
              // accountCubit.updateUser(user.copyWith(country: val));
            },
          ),

          // University
          if (state.country != null)
            CustomDropdownWidget(
              items: StepsData.universities[state.country] ?? [],
              selectedValue: state.university,
              hintText: "Select University",
              onChanged: (val) {
                cubit.selectUniversity(val!);
                // accountCubit.updateUser(user.copyWith(university: val));
              },
            ),
          // Faculty
          if (state.university != null)
            CustomDropdownWidget(
              items: StepsData.faculties[state.university] ?? [],
              selectedValue: state.faculty,
              hintText: "Select Faculty",
              onChanged: (val) {
                cubit.selectFaculty(val!);
                // accountCubit.updateUser(user.copyWith(faculty: val));
              },
            ),

          // Program
          if (state.faculty != null)
            CustomDropdownWidget(
              items: StepsData.programs[state.faculty] ?? [],
              selectedValue: state.program,
              hintText: "Select Program",
              onChanged: (val) {
                cubit.selectProgram(val!);
                // accountCubit.updateUser(user.copyWith(program: val));
              },
            ),

          // Level
          if (state.program != null && state.faculty == "Dentistry")
            CustomDropdownWidget(
              items: StepsData.levels[state.program] ?? [],
              selectedValue: state.stage,
              hintText: "Select Stage",
              onChanged: (val) {
                cubit.selectStage(val!);
                // accountCubit.updateUser(user.copyWith(stage: val));
              },
            ),

          // Specialization
          if (state.stage == "Second" &&
              state.program == "Master" &&
              state.faculty == "Dentistry")
            CustomDropdownWidget(
              items: StepsData.specializations["Second"] ?? [],
              selectedValue: state.specialization,
              hintText: "Select Specialization",
              onChanged: (val) {
                cubit.selectSpecialization(val!);
                // accountCubit.updateUser(user.copyWith(specialization: val));
              },
            ),
        ];

        return Column(
          children: [
            FixedTimeline.tileBuilder(
              theme: TimelineThemeData(nodePosition: 0),
              builder: TimelineTileBuilder.connected(
                itemCount: steps.length,
                contentsBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10,
                  ),
                  child: steps[index],
                ),
                indicatorBuilder: (_, index) {
                  return const DotIndicator(color: Colors.blue);
                },
                connectorBuilder: (_, index, ___) => const SolidLineConnector(),
              ),
            ),
            CustomButton(
              text: "Save",
              onPressed: () {
                final updatedUser = UserAcademicModel(
                  country: state.country,
                  university: state.university,
                  faculty: state.faculty,
                  program: state.program,
                  stage: state.stage,
                  specialization: state.specialization,
                );
                context.read<AccountCubit>().updateUser(updatedUser);
              },
            ),
          ],
        );
      },
    );
  }
}
