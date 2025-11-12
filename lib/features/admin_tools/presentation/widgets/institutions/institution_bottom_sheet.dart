import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/admin_tools/presentation/manager/institutions_cubit/institutions_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';

void institutionBottomSheet(
  BuildContext context,
  String specialization, [
  bool? isEdit = false,
]) {
  final TextEditingController institutionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CustomBottomSheet.show(
    context: context,
    child: BlocProvider(
      create: (context) => InstitutionsCubit(),
      child: SizedBox(
        height: context.height * 0.9,
        width: double.infinity,
        child: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleInButtomSheetWidget(title: "Create Institution"),
                    const SizedBox(height: 20),
                    CustomTextFieldWidget(
                      hintText: "e.g., Cairo University",
                      controller: institutionController,
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Column(
                  children: [
                    Expanded(child: const SizedBox()),
                    BlocConsumer<InstitutionsCubit, InstitutionsState>(
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
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<InstitutionsCubit>()
                                    .addInstitution(
                                      specialization: specialization,
                                      institutionname: normalizeFirestoreName(
                                        institutionController.text.trim(),
                                      ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
