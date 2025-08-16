import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/auth/data/models/user_model.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_state.dart';
import 'package:sinna/features/auth/presentation/view/widgets/custom_drop_down_widget.dart';

class StepsSectionWidget extends StatelessWidget {
  const StepsSectionWidget({
    super.key,
    required this.signUpCubit,
    required this.user,
  });

  final SignUpCubit signUpCubit;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepsCubit, StepsState>(
      builder: (context, state) {
        final stepsCubit = context.read<StepsCubit>();
        return Stepper(
          type: StepperType.vertical,
          physics: const NeverScrollableScrollPhysics(),
          currentStep: state.currentStep,

          onStepTapped: (step) {
            if (step <= state.currentStep) {
              stepsCubit.changeStep(step);
            }
          },
          onStepContinue: () {
            if (state.currentStep < 4) {
              stepsCubit.changeStep(state.currentStep + 1);
            }
          },
          onStepCancel: () {
            if (state.currentStep > 0) {
              stepsCubit.changeStep(state.currentStep - 1);
            }
          },
          steps: [
            Step(
              title: Text("Country", style: AppStyles.textStyle16(context)),

              content: CustomDropdownWidget(
                items: ["egypt", "Saudi Arabia", "UAE"],
                selectedValue: state.selectedCountry,
                hintText: "Select Country",
                onChanged: (value) {
                  stepsCubit.changeCountry(value);
                  signUpCubit.updateUser(user.copyWith(country: value));
                },
                enabled: state.currentStep == 0,
              ),
              isActive: state.currentStep >= 0,
              state: state.selectedCountry != null
                  ? StepState.complete
                  : StepState.indexed,
            ),
            Step(
              title: Text("University", style: AppStyles.textStyle16(context)),
              content: CustomDropdownWidget(
                items: ["mansoura", "Cairo", "Riyadh"],
                selectedValue: state.selectedUniversity,
                hintText: "Select University",
                onChanged: (value) {
                  stepsCubit.changeCountry;
                  signUpCubit.updateUser(user.copyWith(university: value));
                },
                enabled: state.currentStep == 1,
              ),
              isActive: state.currentStep >= 1,
              state: state.selectedUniversity != null
                  ? StepState.complete
                  : StepState.indexed,
            ),
            Step(
              title: Text("College", style: AppStyles.textStyle16(context)),
              content: CustomDropdownWidget(
                items: ["Dentistry", "Nursing", " Medicine"],
                selectedValue: state.selectedUniversity,
                hintText: "Select College",
                onChanged: (value) {
                  stepsCubit.changeCollege;
                  signUpCubit.updateUser(user.copyWith(college: value));
                },
                enabled: state.currentStep == 2,
              ),
              isActive: state.currentStep >= 2,
              state: state.selectedUniversity != null
                  ? StepState.complete
                  : StepState.indexed,
            ),
            Step(
              title: Text("Degree", style: AppStyles.textStyle16(context)),
              content: CustomDropdownWidget(
                items: ["Bachelors", "Masters", "Prometric"],
                selectedValue: state.selectedDegree,
                hintText: "Select Degree",
                onChanged: (value) {
                  stepsCubit.changeCountry;
                  signUpCubit.updateUser(user.copyWith(system: value));
                },
                enabled: state.currentStep == 3,
              ),
              isActive: state.currentStep >= 3,
              state: state.selectedDegree != null
                  ? StepState.complete
                  : StepState.indexed,
            ),
            Step(
              title: Text("Level", style: AppStyles.textStyle16(context)),
              content: CustomDropdownWidget(
                items: ["level one", "level two", "Level Three"],
                selectedValue: state.selectedLevel,
                hintText: "Select Level",
                onChanged: (value) {
                  stepsCubit.changeCountry;
                  signUpCubit.updateUser(user.copyWith(level: value));
                },
                enabled: state.currentStep == 4,
              ),
              isActive: state.currentStep >= 4,
              state: state.selectedLevel != null
                  ? StepState.complete
                  : StepState.indexed,
            ),
          ],
        );
      },
    );
  }
}
