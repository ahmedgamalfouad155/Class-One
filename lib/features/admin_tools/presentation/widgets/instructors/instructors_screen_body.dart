import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/admin_tools/presentation/manager/instructors/instructors_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/instructors/adding_instuctors_dialog.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/instructors/list_of_instructors_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class InstructorsScreenBody extends StatelessWidget {
  const InstructorsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.instructors.tr(),
            style: AppStyles.textStyle24W600(context),
          ),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: CustomsBoxDecoration().profileDecoration(context),
            child: CustomOptionWidget(
              title: LocaleKeys.create_instructor.tr(),
              onTap: () => showDialog(
                context: context,
                builder: (_) => const AddingInstructorDialog(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            LocaleKeys.instructors.tr(),
            style: AppStyles.textStyle16W600Grey(context),
          ),
          const SizedBox(height: 10),
          BlocProvider(
            create: (context) => InstructorsCubit(),
            child: ListOfInstructorsWidget(),
          ),
        ],
      ),
    );
  }
}
