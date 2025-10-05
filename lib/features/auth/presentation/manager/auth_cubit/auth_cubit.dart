import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authService = AuthServicesImpl();

  bool get emailAdmin =>
      authService.currentUser?.email == "ahmedgamal@gmail.com";

  void authStatus() {
    final user = authService.currentUser;
    if (user != null) {
      emit(LoginSuccessState());
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      await _deleteDeviceId();
      await authService.logOut();
      emit(AuthInitial());
    } catch (e) {
      emit(LogoutFailedState(e.toString()));
    }
  }

  Future<void> _deleteDeviceId() async {
    final firestor = FirestoreServices.instance;
    await firestor.deleteFieldFromDocument(
      path: FirestorePath.users(authService.currentUser!.email!),
      fieldName: "deviceId",
    );
  }
}
