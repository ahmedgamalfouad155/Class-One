import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/get_device_id.dart';
import 'package:sinna/features/auth/data/models/user_base_model.dart';
import 'package:sinna/features/auth/data/services/signup_service/signup_service.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  final SignupService authServices = SignupServiceImpl();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? deviceId;

  Future<void> signUp({
    required String password,
    required UserBaseModel userBaseModel,
  }) async {
    emit(SignupLoadingState());
    deviceId = await getDeviceId();
    try {
      final user = await authServices.signUpWithEmailAndPassword(
        userBaseModel.email!,
        password,
      );

      if (user != null) {
        userBaseModel = userBaseModel.copyWith(
          uid: user.email,
          deviceId: deviceId,
        );
        await authServices.setUserData(userBaseModel); 
        emit(SignupSuccessState());
      } else {
        emit(SignupFailedState('Signup failed'));
      }
    } catch (e) {
      emit(SignupFailedState(e.toString()));
    }
  }
}
