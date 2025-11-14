import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/admin_tools/data/models/field_model.dart';

class SpecialtyRadioCubit extends Cubit<FieldModel?> {
  FieldModel? _confirmed; // اللي تم تأكيده
  FieldModel? _temp;      // الاختيار المؤقت

  SpecialtyRadioCubit({FieldModel? initialValue}) : super(initialValue) {
    _confirmed = initialValue;
    _temp = initialValue;
  }

  // اختيار مؤقت (قبل التأكيد)
  void selectTemp(FieldModel field) {
    _temp = field;
    emit(_temp);
  }

  // تأكيد الاختيار
  void confirmSelection() {
    _confirmed = _temp;
    emit(_confirmed);
  }

  // إلغاء التغيير والرجوع للاختيار المؤكد السابق
  void cancelSelection() {
    _temp = _confirmed;
    emit(_confirmed);
  }

  FieldModel? get confirmed => _confirmed;
}
