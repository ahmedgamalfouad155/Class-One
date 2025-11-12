part of 'institutions_cubit.dart';

@immutable
sealed class InstitutionsState {}

/// الحالة الابتدائية
final class InstitutionsInitial extends InstitutionsState {}

/// أثناء تحميل البيانات (Get)
final class InstitutionsLoadingState extends InstitutionsState {}

/// عند نجاح جلب البيانات
final class InstitutionsLoadedState extends InstitutionsState {
  final List<String> institutions;
  InstitutionsLoadedState(this.institutions);
}

/// عند حدوث خطأ أثناء الجلب
final class InstitutionsLoadFailureState extends InstitutionsState {
  final String errMessage;
  InstitutionsLoadFailureState(this.errMessage);
}

/// أثناء الإضافة
final class InstitutionAddingState extends InstitutionsState {}

/// عند نجاح الإضافة
final class InstitutionAddedSuccessState extends InstitutionsState {}

/// عند فشل الإضافة
final class InstitutionAddFailureState extends InstitutionsState {
  final String errMessage;
  InstitutionAddFailureState(this.errMessage);
}

/// أثناء الحذف
final class InstitutionDeletingState extends InstitutionsState {}

/// عند نجاح الحذف
final class InstitutionDeletedSuccessState extends InstitutionsState {
  final String deletedId;
  InstitutionDeletedSuccessState(this.deletedId);
}

/// عند فشل الحذف
final class InstitutionDeleteFailureState extends InstitutionsState {
  final String errMessage;
  InstitutionDeleteFailureState(this.errMessage);
}

/// أثناء التحديث
final class InstitutionUpdatingState extends InstitutionsState {}

/// عند نجاح التحديث
final class InstitutionUpdatedSuccessState extends InstitutionsState {
  final InstitutionModel updatedInstitution;
  InstitutionUpdatedSuccessState(this.updatedInstitution);
}

/// عند فشل التحديث
final class InstitutionUpdateFailureState extends InstitutionsState {
  final String errMessage;
  InstitutionUpdateFailureState(this.errMessage);
}
