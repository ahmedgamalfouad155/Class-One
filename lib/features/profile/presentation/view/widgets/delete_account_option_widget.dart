import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/services/firebase_path.dart';
import 'package:sinna/core/services/firestore_services.dart';
import 'package:sinna/features/profile/presentation/view/widgets/profile_option_widget.dart';

class DeleteAccountOptionWidget extends StatelessWidget {
  const DeleteAccountOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final service = FirestoreServices.instance;
    final uid = FirebaseAuth.instance.currentUser!.email;

    return ProfileOptionWidget(
      title: 'Delete account',
      icon: MaterialCommunityIcons.delete_sweep,
      onTap: () async {
        await service.deleteData(path: FirestorePath.users(uid!));
        await FirebaseAuth.instance.currentUser!.delete();
        // ignore: use_build_context_synchronously
        (context).go(AppRouter.kLogInView);
      },
      color: Colors.red,
    );
  }
}
