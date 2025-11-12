import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/admin_tools/presentation/manager/fields/fields_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';

void fieldsBottomSheet(BuildContext context) {
  final TextEditingController fieldController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CustomBottomSheet.show(
    context: context,
    child: BlocProvider(
      create: (context) => FieldsCubit(),
      child: SizedBox(
        height: context.height * 0.9,
        width: context.width,
        child: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleInButtomSheetWidget(title: "Create Field"),
                    const SizedBox(height: 20),
                    CustomTextFieldWidget(
                      hintText: "e.g., Dentistry",
                      controller: fieldController,
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
                    BlocConsumer<FieldsCubit, FieldsState>(
                      listener: (context, state) {
                        if (state is AddingFieldsSuccessState) {
                          CustomAnimatedDialog.show(
                            context: context,
                            message: "Field added successfully ✅🎉",
                            animationType: DialogAnimationType.success,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AddingFieldsLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is AddingFieldsSuccessState ||
                            state is FieldsInitial) {
                          return CustomButton(
                            text: "Create",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<FieldsCubit>().addField(
                                  normalizeFirestoreName(
                                    fieldController.text.trim(),
                                  ),
                                );
                              }
                            },
                          );
                        } else if (state is AddingFieldsFailureState) { 
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
