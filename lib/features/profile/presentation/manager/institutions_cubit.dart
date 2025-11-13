import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/admin_tools/data/models/institution_model.dart';

class InstitutionsRadioCubit extends Cubit<InstitutionModel?> {
  InstitutionModel? _confirmed; // اللي تم تأكيده
  InstitutionModel? _temp;      // الاختيار المؤقت

  InstitutionsRadioCubit({InstitutionModel? initialValue}) : super(initialValue) {
    _confirmed = initialValue;
    _temp = initialValue;
  }

  // اختيار مؤقت (قبل التأكيد)
  void selectTemp(InstitutionModel institution) {
    _temp = institution;
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

  InstitutionModel? get confirmed => _confirmed;
}
