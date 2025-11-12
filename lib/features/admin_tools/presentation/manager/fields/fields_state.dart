part of 'fields_cubit.dart';

@immutable
sealed class FieldsState {}

final class FieldsInitial extends FieldsState {}

final class FieldsLoadingState extends FieldsState {}

final class FieldsSuccessState extends FieldsState {
  final List<String> fields;
  FieldsSuccessState(this.fields);
}

final class FieldsFailureState extends FieldsState {
  final String errMessage;
  FieldsFailureState(this.errMessage);
}

final class AddingFieldsLoadingState extends FieldsState {}

final class AddingFieldsSuccessState extends FieldsState {}

final class AddingFieldsFailureState extends FieldsState {
  final String errMessage;
  AddingFieldsFailureState(this.errMessage);
}
