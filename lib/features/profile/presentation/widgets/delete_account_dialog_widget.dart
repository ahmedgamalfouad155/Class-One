import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/profile/presentation/manager/deleting_account_cubit.dart';

class DeleteAccountDialogWidget extends StatefulWidget {
  const DeleteAccountDialogWidget({super.key});

  @override
  State<DeleteAccountDialogWidget> createState() =>
      _DeleteAccountDialogWidgetState();
}

class _DeleteAccountDialogWidgetState extends State<DeleteAccountDialogWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final service = DeletingAccountCubit();

    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: context.appColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text("Delete Account", style: AppStyles.textStyle20W600(context)),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want to delete your account?\nThis action cannot be undone.",
              style: AppStyles.textStyle16W600Grey(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            CustomTextFieldWidget(
              hintText: "Email",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            CustomTextFieldWidget(
              hintText: "Password",
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // إلغاء
          child: Text("Cancel", style: AppStyles.textStyle16W600(context)),
        ),
        CustomButton(
          bacgrouncColor: context.appColors.red,
          borderSideColor: context.appColors.red,
          width: context.width / 3,
          text: "Delete",
          onPressed: _loading
              ? null
              : () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => _loading = true);

                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();

                    final success = await service.deleteAccount(
                      email,
                      password,
                    );

                    setState(() => _loading = false);

                    if (success && context.mounted) {
                      context.go(AppRouter.klandingScreen);
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Failed to delete account"),
                        ),
                      );
                    }
                  }
                },
        ),
      ],
    );
  }
}
