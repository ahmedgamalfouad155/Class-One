import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/profile/data/control_panal_service.dart';
import 'package:sinna/features/profile/presentation/manager/control_panal_cubit/control_panal_state.dart';

class ControlPanalCubit extends Cubit<ControlPanalState> {
  ControlPanalCubit() : super(ControlPanalInitial());
  final ControlPanalService service = ControlPanalServiceImpl();

  Future<void> getUserCourses({required String email}) async {
    final ControlPanalService service = ControlPanalServiceImpl();
    emit(DisplanyingUserCoursesLoadingState());
    bool usersIsExist = false;
    if (email.isNotEmpty) {
      usersIsExist = await service.checkUserExists(email);
    }
    try {
      if (usersIsExist) {
        final courses = await service.getUserCourses(email);
        emit(DisplanyingUserCoursesSuccessState(courses));
      } else {
        emit(DisplanyingUserCoursesFailureState("User not found"));
      }
    } catch (e) {
      emit(DisplanyingUserCoursesFailureState(e.toString()));
    }
  }

  Future<void> editUserPaid({
    required String email,
    required bool isPaid,
    required String id,
  }) async {
    try {
      await service.editUserPaid(email, isPaid, id);
      print("tmam = $isPaid");
    } catch (e) {
      emit(DisplanyingUserCoursesFailureState(e.toString()));
    }
  }
}
