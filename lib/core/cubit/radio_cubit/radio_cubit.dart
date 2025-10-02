import 'package:flutter_bloc/flutter_bloc.dart';

class RadioCubit extends Cubit<String?> {
  String? _confirmed; // اللي معموله Confirm
  String? _temp;      // اللي بيتغير جوه الدايلوج

  RadioCubit({String? initialValue}) : super(initialValue) {
    _confirmed = initialValue;
    _temp = initialValue;
  }

  // اختيار مؤقت (جوه الدايلوج)
  void selectTemp(String title) {
    _temp = title;
    emit(_temp);
  }

  // تأكيد الاختيار
  void confirmSelection() {
    _confirmed = _temp;
    emit(_confirmed);
  }

  // إلغاء والرجوع للحالة اللي قبل الدايلوج
  void cancelSelection() {
    _temp = _confirmed;
    emit(_confirmed);
  }

  String? get confirmed => _confirmed;
}
