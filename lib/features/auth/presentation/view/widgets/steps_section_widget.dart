import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_state.dart';
import 'package:sinna/features/auth/presentation/view/widgets/custom_drop_down_widget.dart';
import 'package:timelines_plus/timelines_plus.dart';

class StepsSectionWidget extends StatelessWidget {
  const StepsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    final user = context.watch<SignUpCubit>().state.user;

    return BlocProvider(
      create: (_) => StepsCubit(),
      child: BlocBuilder<StepsCubit, StepsState>(
        builder: (context, state) {
          final cubit = context.read<StepsCubit>();

          final steps = <Widget>[
            CustomDropdownWidget(
              items: StepsData.universities.keys.toList(),
              selectedValue: state.country,
              hintText: "Select Country",
              onChanged: (val) {
                cubit.selectCountry(val!);
                // signUpCubit.updateUser(user.copyWith(country: val));
              },
            ),

            if (state.country != null)
              CustomDropdownWidget(
                items: StepsData.universities[state.country] ?? [],
                selectedValue: state.university,
                hintText: "Select University",
                onChanged: (val) {
                  cubit.selectUniversity(val!);
                  // signUpCubit.updateUser(user.copyWith(university: val));
                },
              ),
            if (state.university != null)
              CustomDropdownWidget(
                items: StepsData.faculties[state.university] ?? [],
                selectedValue: state.faculty,
                hintText: "Select Faculty",
                onChanged: (val) {
                  cubit.selectFaculty(val!);
                  // signUpCubit.updateUser(user.copyWith(faculty: val));
                },
              ),

            if (state.faculty != null)
              CustomDropdownWidget(
                items: StepsData.programs[state.faculty] ?? [],
                selectedValue: state.program,
                hintText: "Select Program",
                onChanged: (val) {
                  cubit.selectProgram(val!);
                  // signUpCubit.updateUser(user.copyWith(program: val));
                },
              ),

            if (state.program != null &&
                StepsData.levels.containsKey(state.program))
              CustomDropdownWidget(
                items: StepsData.levels[state.program] ?? [],
                selectedValue: state.stage,
                hintText: "Select Level",
                onChanged: (val) {
                  cubit.selectStage(val!);
                  // signUpCubit.updateUser(user.copyWith(stage: val));
                },
              ),

            if (state.stage == "Second")
              CustomDropdownWidget(
                items: StepsData.specializations["Second"] ?? [],
                selectedValue: state.specialization,
                hintText: "Select Specialization",
                onChanged: (val) {
                  cubit.selectSpecialization(val!);
                  // signUpCubit.updateUser(user.copyWith(specialization: val));
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
                    return DotIndicator(color: Colors.blue);
                  },
                  connectorBuilder: (_, index, ___) =>
                      const SolidLineConnector(),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Next",
                onPressed: () {
                  final updatedUser = UserAcademicModel(
                    country: state.country,
                    university: state.university,
                    faculty: state.faculty,
                    program: state.program,
                    stage: state.stage,
                    specialization: state.specialization,
                  );
                  signUpCubit.updateUser(updatedUser);
                  // signUpCubit.nextPage();
                  print(user.specialization);
                },
                width: AppMedia.width(context) / 2,
              ),
            ],
          );
        },
      ),
    );
  }
}
