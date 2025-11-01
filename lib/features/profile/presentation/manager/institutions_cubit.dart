import 'package:flutter_bloc/flutter_bloc.dart';

class InstitutionsRadioCubit extends Cubit<String?> {
  String? _confirmed;
  String? _temp;

  InstitutionsRadioCubit({String? initialValue}) : super(initialValue) {
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
