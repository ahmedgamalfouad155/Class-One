import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/admin_tools/data/models/field_model.dart';
import 'package:sinna/features/admin_tools/presentation/manager/fields/fields_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_field_button_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/update_field_button_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';

void fieldsBottomSheet(
  BuildContext context, [
  bool? isEdit = false,
  FieldModel? field,
]) {
  final TextEditingController fieldController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  isEdit == true ? fieldController.text = field!.name : '';
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
                    TitleInButtomSheetWidget(
                      title: isEdit == false ? "Create Field" : "Update Field",
                    ),
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
                    isEdit == false
                        ? CreateFieldButtonWidget(
                            formKey: formKey,
                            fieldController: fieldController,
                          )
                        : UpdateFieldButtonWidget(
                            field: field!,
                            fieldController: fieldController,
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
