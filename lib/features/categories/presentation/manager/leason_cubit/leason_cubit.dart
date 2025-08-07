import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/categories/data/services/leson_services.dart';
import 'package:sinna/features/categories/presentation/manager/leason_cubit/leason_state.dart';

class LeasonCubit extends Cubit<LeasonState> {
  LeasonCubit() : super(LeasonInitial());

  final LesonServices lesonServices = LesonServicesImpl();

  Future<void> getLeson({
    required String country,
    required String university,
    required String system,
    required String level,
    required String subject,
    required String term,
    required String doctor,
  }) async {
    emit(LeasonLoadingState());
    try {
      final leson = await lesonServices.getLesons(
        country: country,
        university: university,
        system: system,
        level: level,
        subject: subject,
        term: term,
        doctor: doctor,
      );
      emit(LeasonSuccessState(leson));
    } catch (e) {
      emit(LeasonFailureState(e.toString()));
    }
  }
}
