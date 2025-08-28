
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/profile/presentation/manager/deleting_account_cubit.dart';

class DeleteAccountDialogWidget extends StatefulWidget {
  const DeleteAccountDialogWidget({super.key});

  @override
  State<DeleteAccountDialogWidget> createState() => _DeleteAccountDialogWidgetState();
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
      title: const Text("Delete Account"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Are you sure you want to delete your account?\nThis action cannot be undone.",
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
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
                      context.go(AppRouter.kLogInView);
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
          child: _loading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text("Delete"),
        ),
      ],
    );
  }
}
