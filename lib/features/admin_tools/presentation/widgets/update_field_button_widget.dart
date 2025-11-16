import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/data/models/field_model.dart';
import 'package:sinna/features/admin_tools/presentation/manager/fields/fields_cubit.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class UpdateFieldButtonWidget extends StatelessWidget {
  const UpdateFieldButtonWidget({
    super.key,
    required this.field,
    required this.fieldController,
  });
  final FieldModel field;
  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FieldsCubit, FieldsState>(
      buildWhen: (previous, current) =>
          current is UpdatingFieldLoadingState ||
          current is UpdatingFieldSuccessState ||
          current is UpdatingFieldFailureState ||
          current is FieldsInitial,
      listener: (context, state) {
        if (state is UpdatingFieldSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "${LocaleKeys.field_updated_successfully.tr()} ✅🎉",
            animationType: DialogAnimationType.success,
          );
        }
      },
      builder: (context, state) {
        if (state is UpdatingFieldLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UpdatingFieldSuccessState || state is FieldsInitial) {
          return CustomButton(
            text: LocaleKeys.update.tr(),
            onPressed: () {
              context.read<FieldsCubit>().updateField(
                FieldModel(id: field.id, name: fieldController.text.trim()),
              );
            },
          );
        }
        if (state is UpdatingFieldFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
