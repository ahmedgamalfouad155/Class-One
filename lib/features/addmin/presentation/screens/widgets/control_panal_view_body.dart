import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/addmin/presentation/manager/control_panal_cubit/control_panal_cubit.dart';
import 'package:sinna/features/addmin/presentation/manager/control_panal_cubit/control_panal_state.dart';
import 'package:sinna/features/addmin/presentation/screens/widgets/subject_item_control_panal_widget.dart';

class ControlPanalScreenBody extends StatefulWidget {
  const ControlPanalScreenBody({super.key});

  @override
  State<ControlPanalScreenBody> createState() => _ControlPanalScreenBodyState();
}

class _ControlPanalScreenBodyState extends State<ControlPanalScreenBody> {
  final emailContrler = TextEditingController();
  @override
  dispose() {
    emailContrler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CustomTextFieldWidget(
            hintText: "Enter User Email",
            controller: emailContrler,
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: "Search",
            onPressed: () {
              context.read<ControlPanalCubit>().getUserCourses(
                email: emailContrler.text,
              );
            },
          ),
          const SizedBox(height: 20),
          BlocConsumer<ControlPanalCubit, ControlPanalState>(
            listener: (context, state) {
              if (state is DisplanyingUserCoursesFailureState) {
                CustomAnimatedDialog.show(
                  context: context,
                  message: state.errMessage,
                  animationType: DialogAnimationType.warning,
                );
              } else if (state is DisplanyingUserCoursesSuccessState) {
                if (state.courses.isEmpty) {
                  CustomAnimatedDialog.show(
                    context: context,
                    message: "This User Don't Have Any Courses",
                    animationType: DialogAnimationType.info,
                  );
                }
              }
            },
            builder: (context, state) {
              if (state is DisplanyingUserCoursesLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DisplanyingUserCoursesFailureState) {
                return Text(state.errMessage);
              } else if (state is DisplanyingUserCoursesSuccessState) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: .8,
                        ),
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      return SubjectItemControlPanalWidget(
                        onTap: () {},
                        coursePath: state.courses[index],
                        email: emailContrler.text,
                      );
                    },
                  ),
                );
              } else {
                return const Text("sersh");
              }
            },
          ),
        ],
      ),
    );
  }
}
