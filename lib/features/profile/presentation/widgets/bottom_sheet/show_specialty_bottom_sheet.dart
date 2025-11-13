import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/admin_tools/data/models/field_model.dart';
import 'package:sinna/features/profile/presentation/manager/preferences_cubit/preferences_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/specialty_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';
// ignore_for_file: deprecated_member_use
import 'package:sinna/core/theme/colors.dart';

void showSpecialtyBottomSheet(
  BuildContext context,
  SpecialtyRadioCubit radioCubit,
  PreferencesCubit preferencesCubit,
) {
  CustomBottomSheet.show(
    context: context,
    child: MultiBlocProvider(
      providers: [
        BlocProvider.value(value: radioCubit),
        BlocProvider.value(value: preferencesCubit..getSpecialty()),
      ],
      child: SizedBox(
        height: context.height * 0.9,
        width: context.width,
        child: SingleChildScrollView(
          child: Builder(
            builder: (context) {
              return BlocBuilder<PreferencesCubit, PreferencesState>(
                builder: (context, state) {
                  if (state is SpecialtyLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is SpecialtySuccessState) { 
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TitleInButtomSheetWidget(
                          title: LocaleKeys.specialty.tr(),
                        ),
                        SpecialtyRadioGroup(options: state.specialty),
                      ],
                    );
                  }
                  if (state is InstitutionsSuccessState ||
                      state is InstitutionsFailedState ||
                      state is InstitutionsLoadingState) {
                    final prevState = context
                        .read<PreferencesCubit>()
                        .previousSpecialties;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TitleInButtomSheetWidget(
                          title: LocaleKeys.specialty.tr(),
                        ),
                        SpecialtyRadioGroup(options: prevState),
                      ],
                    );
                  }
                  if (state is SpecialtyFailedState) {
                    return Text(state.errorMessage);
                  }
                  return const Text("error");
                },
              );
            },
          ),
        ),
      ),
    ),
  );
}

class SpecialtyRadioGroup extends StatelessWidget {
  final List<FieldModel> options;
  const SpecialtyRadioGroup({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(options.length, (index) {
        final option = options[index];
        return Column(
          children: [
            SpecialtyRadioWidget(option: option),
            if (index != options.length - 1) const CustomDividerWidget(),
          ],
        );
      }),
    );
  }
}

class SpecialtyRadioWidget extends StatelessWidget {
  const SpecialtyRadioWidget({super.key, required this.option});

  final FieldModel option;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtyRadioCubit, FieldModel?>(
      builder: (context, selected) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option.name),
            Radio<String>(
              value: option.id, // نستخدم id كـ value فريدة
              groupValue: selected?.id, // نطابق بناءً على id
              onChanged: (value) {
                if (value != null) {
                  context.read<SpecialtyRadioCubit>().selectTemp(
                    FieldModel(id: option.id, name: option.name),
                  );
                }
              },
              activeColor: context.appColors.blue,
            ),
          ],
        );
      },
    );
  }
}
