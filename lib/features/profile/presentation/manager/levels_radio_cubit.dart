import 'package:flutter_bloc/flutter_bloc.dart';

class LevelsRadioCubit extends Cubit<String?> {
  String? _confirmed;
  String? _temp;

  LevelsRadioCubit({String? initialValue}) : super(initialValue) {
    _confirmed = initialValue;
    _temp = initialValue;
  }

  void selectTemp(String title) {
    _temp = title;
    emit(_temp);
  }

  void confirmSelection() {
    _confirmed = _temp;
    emit(_confirmed);
  }

  void cancelSelection() {
    _temp = _confirmed;
    emit(_confirmed);
  }

  String? get confirmed => _confirmed;
}
