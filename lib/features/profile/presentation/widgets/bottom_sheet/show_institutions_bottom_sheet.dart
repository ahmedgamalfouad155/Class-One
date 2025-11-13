import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/images.dart'; 
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_empty_screen.dart';
import 'package:sinna/core/widgets/institutions_radio_widget.dart';
import 'package:sinna/features/admin_tools/data/models/institution_model.dart';
import 'package:sinna/features/profile/presentation/manager/institutions_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/preferences_cubit/preferences_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/generated/locale_keys.g.dart';

void showInstitutionsBottomSheet(
  BuildContext context,
  InstitutionsRadioCubit radioCubit,
  PreferencesCubit preferencesCubit,
) {
  CustomBottomSheet.show(
    context: context,
    child: MultiBlocProvider(
      providers: [
        BlocProvider.value(value: radioCubit),
        BlocProvider.value(value: preferencesCubit),
      ],
      child: SizedBox(
        height: context.height * 0.9,
        width: context.width,
        child: SingleChildScrollView(
          child: Builder(
            builder: (context) {
              return BlocBuilder<PreferencesCubit, PreferencesState>(
                builder: (context, state) {
                  if (state is InstitutionsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is InstitutionsSuccessState) { 
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TitleInButtomSheetWidget(
                          title: LocaleKeys.institutions.tr(),
                        ),
                        InstitutionsRadioGroup(options: state.institutions),
                      ],
                    );
                  }
                  if (state is InstitutionsFailedState) {
                    return Text(state.errorMessage);
                  }
                  return Center(
                    child: CustomEmptyScreen(
                      image: AppImages.emptyDashbord,
                      title: "No Institutions Found",
                      subTitle: "Please select a specialty first",
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    ),
  );
}

class InstitutionsRadioGroup extends StatelessWidget {
  final List<InstitutionModel> options;
  const InstitutionsRadioGroup({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(options.length, (index) {
        final option = options[index];
        return Column(
          children: [
            InstitutionsRadioWidget(option: option),
            if (index != options.length - 1) const CustomDividerWidget(),
          ],
        );
      }),
    );
  }
}
