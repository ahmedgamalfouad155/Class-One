import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/manager/institutions_radio_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/levels_radio_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/preferences_cubit/preferences_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/specialty_radio_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/institutions_info_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/levels_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/specialty_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class PreferencesScreenBody extends StatelessWidget {
  const PreferencesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SpecialtyRadioCubit()),
        BlocProvider(create: (_) => InstitutionsRadioCubit()),
        BlocProvider(create: (_) => LevelsRadioCubit()),
        BlocProvider(create: (_) => PreferencesCubit()),
      ],
      child: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.preferences.tr(),
                  style: AppStyles.textStyle24W600(context),
                ),
                const SizedBox(height: 20),
                BlocProvider.value(
                  value: BlocProvider.of<SpecialtyRadioCubit>(context),
                  child: const SpecialtyWidget(),
                ),
                const SizedBox(height: 15),
                BlocProvider.value(
                  value: BlocProvider.of<InstitutionsRadioCubit>(context),
                  child: const InstitutionsInfoWidget(),
                ),
                const SizedBox(height: 15),
                BlocProvider.value(
                  value: BlocProvider.of<LevelsRadioCubit>(context),
                  child: const LevelsWidget(),
                ),
                const SizedBox(height: 15),
              ],
            ),
          );
        },
      ),
    );
  }
}
