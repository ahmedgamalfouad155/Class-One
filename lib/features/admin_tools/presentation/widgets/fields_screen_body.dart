import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/admin_tools/presentation/manager/fields/fields_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/fields_app_bar_widget.dart';

class FieldsScreenBody extends StatelessWidget {
  const FieldsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FieldsAppBarWidget(),
            const SizedBox(height: 10),
            Text("Fields", style: AppStyles.textStyle24W600(context)),
            const SizedBox(height: 10),
            BlocProvider(
              create: (context) => FieldsCubit()..getFields(),
              child: Builder(
                builder: (context) {
                  return BlocBuilder<FieldsCubit, FieldsState>(
                    builder: (context, state) {
                      if (state is FieldsLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is FieldsSuccessState) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Column(
                            children: [
                              CustomOptionWidget(
                                title: state.fields[index].name,
                                onTap: () {
                                  GoRouter.of(context).push(
                                    AppRouter.kInstitutionsScreen,
                                    extra: state.fields[index],
                                  );
                                },
                              ),
                              if (index != state.fields.length - 1)
                                const CustomDividerWidget(),
                            ],
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: state.fields.length,
                        );
                      }
                      if (state is FieldsFailureState) {
                        return Text(state.errMessage);
                      } else {
                        return const Text("error");
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
