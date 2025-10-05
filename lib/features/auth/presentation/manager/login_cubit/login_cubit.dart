
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/get_device_id.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_base_model.dart';
import 'package:sinna/features/auth/data/services/login_service/login_services.dart';
import 'package:sinna/features/auth/presentation/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginServices loginServices = LoginServceImpl();

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());

    try {
      final user = await loginServices.loginWithEmailAndPassword(
        email,
        password,
      );
      if (user != null) {
        final isSameDevice = await _isSameDeviceAsRegistered(email);
        if (isSameDevice) {
          emit(LoginSuccessState());
        } else {
          emit(NotSameDeviceState());
        }
      } else {
        emit(LoginFailedState('Login failed'));
      }
    } catch (e) {
      emit(LoginFailedState(e.toString()));
    }
  }
}

Future<bool> _isSameDeviceAsRegistered(String email) async {
  final firestor = FirestoreServices.instance;
  final String? deviceIdByEmail;
  final String? deviceId;
  var userData = await firestor.getDocument(
    path: FirestorePath.users(email),
    builder: (data, documentId) {
      return UserBaseModel.fromMap(data, documentId);
    },
  );
  deviceIdByEmail = userData.deviceId;
  deviceId = await getDeviceId();

  if (deviceIdByEmail != null) {
    if (deviceIdByEmail == deviceId) {
      return true;
    } else {
      return false;
    }
  }
  { 
    userData= userData.copyWith(deviceId: deviceId);
    await firestor.updatedata(
      path: FirestorePath.users(email),
      data: userData.toMap(),
    ); 
    return true;
  }
}
