import 'package:flutter_bloc/flutter_bloc.dart';

/// موديل للتخصص
class SpecialtyItem {
  final String id;
  final String name;

  SpecialtyItem({required this.id, required this.name});
}

/// Cubit لتخزين التخصص المختار
class SpecialtyCubit extends Cubit<SpecialtyItem?> {
  SpecialtyItem? _confirmed; // العنصر المؤكد
  SpecialtyItem? _temp;      // العنصر المؤقت (داخل الدايلوج)

  SpecialtyCubit({SpecialtyItem? initialValue}) : super(initialValue) {
    _confirmed = initialValue;
    _temp = initialValue;
  }

  /// اختيار مؤقت
  void selectTemp(SpecialtyItem item) {
    _temp = item;
    emit(_temp);
  }

  /// تأكيد الاختيار
  void confirmSelection() {
    _confirmed = _temp;
    emit(_confirmed);
  }

  /// إلغاء والرجوع للحالة السابقة
  void cancelSelection() {
    _temp = _confirmed;
    emit(_confirmed);
  }

  /// العنصر المؤكد الحالي
  SpecialtyItem? get confirmed => _confirmed;
}
