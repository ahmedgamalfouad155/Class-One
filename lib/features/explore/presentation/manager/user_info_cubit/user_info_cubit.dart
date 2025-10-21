

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/explore/data/services/user_info_service.dart';
import 'package:sinna/features/explore/presentation/manager/user_info_cubit/user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitial()) {
    getUserInfo();
  }
  final UserInfoServiceImpl profileService = UserInfoServiceImpl();
  void getUserInfo() async {
    emit(UserInfoLoadingState());
    try {
      final userModel = await profileService.getUserInfo(); 
      emit(UserInfoSuccessState(userModel));
    } catch (e) {
      emit(UserInfoFailedState(e.toString()));
    }
  }
}
