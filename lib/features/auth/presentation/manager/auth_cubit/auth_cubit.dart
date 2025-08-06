import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_state.dart';

enum AuthStatus { initial, authenticated, unauthenticated }

class AuthCubit extends Cubit<AuthState> with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;

  AuthCubit(this._firebaseAuth) : super(AuthState(status: AuthStatus.initial)) {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        emit(AuthState(status: AuthStatus.authenticated, user: user));
      } else {
        emit(AuthState(status: AuthStatus.unauthenticated));
      }
      notifyListeners(); 
    });
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
