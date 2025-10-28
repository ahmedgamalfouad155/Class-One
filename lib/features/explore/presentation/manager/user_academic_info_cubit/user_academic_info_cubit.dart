import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/explore/data/services/user_academic_info_service.dart';
import 'package:sinna/features/explore/presentation/manager/user_academic_info_cubit/user_academic_info_state.dart';

class UserAcademicInfoCubit extends Cubit<UserAcademicInfoState> {
  UserAcademicInfoCubit() : super(UserAcademicInfoInitial()) {
    getUserInfo();
  }
  final UserAcademicInfoServiceImpl profileService =
      UserAcademicInfoServiceImpl();
  void getUserInfo() async {
    emit(UserAcademicInfoLoadingState());
    try {
      final userModel = await profileService.getUserInfo();
      emit(UserAcademicInfoSuccessState(userModel));
    } catch (e) {
      emit(UserAcademicInfoFailedState(e.toString()));
    }
  }
}
