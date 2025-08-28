import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:sinna/features/profile/presentation/view/widgets/delete_account_dialog_widget.dart';
import 'package:sinna/features/profile/presentation/view/widgets/profile_option_widget.dart';

class DeleteAccountOptionWidget extends StatelessWidget {
  const DeleteAccountOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileOptionWidget(
      title: 'Delete account',
      icon: MaterialCommunityIcons.delete_sweep,
      color: Colors.red,
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => const DeleteAccountDialogWidget(),
        );
      },
    );
  }
}
