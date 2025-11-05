import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/explore/data/services/user_academic_info_service.dart';
import 'package:sinna/features/explore/presentation/manager/user_academic_info_cubit/user_academic_info_state.dart';

class UserAcademicInfoCubit extends Cubit<UserAcademicInfoState> {
  UserAcademicInfoCubit() : super(UserAcademicInfoInitial()) {
    getUserInfo();
  }
  final UserAcademicInfoServiceImpl profileService =
      UserAcademicInfoServiceImpl();
  StreamSubscription? _userInfoSubscription;

  void getUserInfo() async {
    emit(UserAcademicInfoLoadingState());
    _userInfoSubscription = profileService.getUserInfo().listen(
      (userModel) {
        emit(UserAcademicInfoSuccessState(userModel));
      },
      onError: (e) {
        emit(UserAcademicInfoFailedState(e.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _userInfoSubscription?.cancel();
    return super.close();
  }
}
