import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/data/models/user_info_model.dart';
import 'package:sinna/features/profile/data/user_info_service.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitial());
  final UserInfoService profileService = UserInfoServiceImpl();
  StreamSubscription? _userInfoSubscription;

  void getUserInfo() async {
    emit(UserInfoLoadingState());
    _userInfoSubscription = profileService.getUserInfo().listen(
      (userModel) {
        emit(UserInfoSuccessState(userModel));
      },
      onError: (e) {
        emit(UserInfoFailedState(e.toString()));
      },
    );
  }

  Future<void> updateUserName(String name) async {
    emit(UserInfoUpdateLoadingState());
    try {
      await profileService.updateUserName(name);
      emit(UserInfoUpdateSuccessState());
    } catch (e) {
      emit(UserInfoUpdateFailedState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _userInfoSubscription?.cancel();
    return super.close();
  }
}
