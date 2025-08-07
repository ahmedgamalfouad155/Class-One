import 'package:sinna/features/categories/data/models/leson_model.dart';

sealed class LeasonState {}

final class LeasonInitial extends LeasonState {}

final class LeasonLoadingState extends LeasonState {}

final class LeasonSuccessState extends LeasonState {
  final List<LesonModel> leason; 
  LeasonSuccessState( this.leason);
}

final class LeasonFailureState extends LeasonState {
  final String errMessage;

  LeasonFailureState(this.errMessage);
}
