import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/presentation/manager/institutions_cubit/institutions_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/cancel_button_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/institutions_title_and_sub_title_and_field_section.dart';

class AddingInstitutionsDialog extends StatefulWidget {
  const AddingInstitutionsDialog({super.key});

  @override
  State<AddingInstitutionsDialog> createState() =>
      _AddingInstitutionsDialogState();
}

class _AddingInstitutionsDialogState extends State<AddingInstitutionsDialog> {
  final TextEditingController institutionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    institutionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InstitutionsCubit(),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: context.appColors.white,
        child: Form(
          key: _formKey,
          child: Container(
            width: context.width * .9,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InstitutionsTitleAndSubTitleAndFieldSection(
                  institutionController: institutionController,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: CancelButtonWidget()),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BlocConsumer<InstitutionsCubit, InstitutionsState>(
                        buildWhen: (previous, current) =>
                            current is InstitutionsInitial ||
                            current is InstitutionAddedSuccessState ||
                            current is InstitutionAddFailureState ||
                            current is InstitutionAddingState,
                        listener: (context, state) {
                          if (state is InstitutionAddedSuccessState) {
                            CustomAnimatedDialog.show(
                              context: context,
                              message: "Institution added successfully ✅🎉",
                              animationType: DialogAnimationType.success,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is InstitutionAddingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is InstitutionAddedSuccessState ||
                              state is InstitutionsInitial) {
                            return CustomButton(
                              text: "Save",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<InstitutionsCubit>()
                                      .addInstitution(
                                        institutionController.text,
                                      );
                                }
                              },
                            );
                          }
                          if (state is InstitutionAddFailureState) {
                            return Text(state.errMessage);
                          } else {
                            return const Text("error");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
