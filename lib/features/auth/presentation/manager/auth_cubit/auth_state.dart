import 'package:firebase_auth/firebase_auth.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class AuthState {
  final AuthStatus status;
  final User? user;

  AuthState({required this.status, this.user});
}
