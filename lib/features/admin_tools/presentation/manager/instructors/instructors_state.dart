part of 'instructors_cubit.dart';

@immutable
sealed class InstructorsState {}

/// الحالة الابتدائية
final class InstructorsInitial extends InstructorsState {}

/// أثناء تحميل البيانات (Get)
final class InstructorsLoadingState extends InstructorsState {}

/// عند نجاح جلب البيانات
final class InstructorsLoadedState extends InstructorsState {
  final List<InstructorModel> instructors;
  InstructorsLoadedState(this.instructors);
}

/// عند حدوث خطأ أثناء الجلب
final class InstructorsLoadFailureState extends InstructorsState {
  final String errMessage;
  InstructorsLoadFailureState(this.errMessage);
}

/// أثناء إضافة إنستراكتور
final class InstructorAddingState extends InstructorsState {}

/// عند نجاح الإضافة
final class InstructorAddedSuccessState extends InstructorsState { 
}

/// عند فشل الإضافة
final class InstructorAddFailureState extends InstructorsState {
  final String errMessage;
  InstructorAddFailureState(this.errMessage);
}

/// أثناء الحذف
final class InstructorDeletingState extends InstructorsState {}

/// عند نجاح الحذف
final class InstructorDeletedSuccessState extends InstructorsState {
  final String deletedId;
  InstructorDeletedSuccessState(this.deletedId);
}

/// عند فشل الحذف
final class InstructorDeleteFailureState extends InstructorsState {
  final String errMessage;
  InstructorDeleteFailureState(this.errMessage);
}

/// أثناء التحديث
final class InstructorUpdatingState extends InstructorsState {}

/// عند نجاح التحديث
final class InstructorUpdatedSuccessState extends InstructorsState {
  final InstructorModel updatedInstructor;
  InstructorUpdatedSuccessState(this.updatedInstructor);
}

/// عند فشل التحديث
final class InstructorUpdateFailureState extends InstructorsState {
  final String errMessage;
  InstructorUpdateFailureState(this.errMessage);
}
