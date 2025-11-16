import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/profile/presentation/manager/user_info/user_info_cubit.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class NameScreenBody extends StatefulWidget {
  const NameScreenBody({super.key});

  @override
  State<NameScreenBody> createState() => _NameScreenBodyState();
}

class _NameScreenBodyState extends State<NameScreenBody> {
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<UserInfoCubit, UserInfoState>(
          bloc: context.read<UserInfoCubit>()..getUserInfo(),
          listener: (context, state) {
            if (state is UserInfoSuccessState) {
              nameController.text = state.userModel.name!;
            } else if (state is UserInfoUpdateSuccessState) {
              CustomAnimatedDialog.show(
                context: context,
                message: "${LocaleKeys.name_updated_successfully.tr()} ✅🎉",
                animationType: DialogAnimationType.success,
              );
            }
          },
          builder: (context, state) {
            if (state is UserInfoLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserInfoInitial ||
                state is UserInfoSuccessState ||
                state is UserInfoUpdateSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.name.tr(),
                    style: AppStyles.textStyle16w400Grey(context),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFieldWidget(
                    hintText: "Ahmed Gamal",
                    controller: nameController,
                  ),
                  const SizedBox(height: 32),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      text: LocaleKeys.change.tr(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<UserInfoCubit>().updateUserName(
                            nameController.text.trim(),
                          );
                        }
                      },
                      width: context.width / 4,
                    ),
                  ),
                ],
              );
            } else if (state is UserInfoFailedState) {
              return Text(state.error);
            }
            return const Text("error");
          },
        ),
      ),
    );
  }
}
