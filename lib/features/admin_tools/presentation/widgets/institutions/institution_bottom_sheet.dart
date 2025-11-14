import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/admin_tools/data/models/institution_model.dart';
import 'package:sinna/features/admin_tools/presentation/manager/institutions_cubit/institutions_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/save_institution_button_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/update_institution_button_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';

void institutionBottomSheet(
  BuildContext context,
  String specializationId, [
  bool? isEdit = false,
  InstitutionModel? institution,
]) {
  final TextEditingController institutionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  isEdit == true ? institutionController.text = institution!.name : '';

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
                    TitleInButtomSheetWidget(
                      title: isEdit == true
                          ? "Edit Institution"
                          : "Create Institution",
                    ),
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
                    isEdit == false
                        ? SaveInstitutionButtonWidget(
                            formKey: formKey,
                            institutionController: institutionController,
                            specializationId: specializationId,
                          )
                        : Column(
                            children: [
                              UpdateInstitutionButtonWidget(
                                formKey: formKey,
                                institution: institution!,
                                institutionController: institutionController,
                                specializationId: specializationId,
                              ),
                              // const SizedBox(height: 10),
                              // DeleteInstitutionButtonWidget(
                              //   specializationId: specializationId,
                              //   institutionId: institution.id,
                              // ),
                            ],
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
