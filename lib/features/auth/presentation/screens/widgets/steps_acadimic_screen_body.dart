import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:sinna/features/auth/presentation/screens/widgets/steps_section_widget.dart';

class StepsAcadimicScreenBody extends StatelessWidget {
  const StepsAcadimicScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => StepsCubit(),
          child: StepsSectionWidget(),
        ),
      ),
    );
  }
}
