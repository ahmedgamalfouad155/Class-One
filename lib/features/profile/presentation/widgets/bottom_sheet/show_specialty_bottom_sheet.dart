import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/profile/presentation/manager/preferences_cubit/preferences_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/bottom_sheet/custom_radio_group.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

void showSpecialtyBottomSheet(BuildContext context, RadioCubit radioCubit) {
  CustomBottomSheet.show(
    context: context,
    child: BlocProvider.value(
      value: radioCubit,
      child: BlocProvider(
        create: (context) => PreferencesCubit()..getSpecialty(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.height * .8,
            minWidth: context.width,
          ),
          child: SingleChildScrollView(
            child: Builder(
              builder: (context) {
                return BlocBuilder<PreferencesCubit, PreferencesState>(
                  builder: (context, state) {
                    if (state is SpecialtyLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is SpecialtyLoadedState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TitleInButtomSheetWidget(
                            title: LocaleKeys.specialty.tr(),
                          ),
                          CustomRadioGroup(options: state.specialty),
                        ],
                      );
                    }
                    if (state is SpecialtyLoadingFailedState) {
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
    ),
  );
}
