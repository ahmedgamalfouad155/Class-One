import 'package:flutter_bloc/flutter_bloc.dart';

class TermSwitcherCubit extends Cubit<bool> {
  TermSwitcherCubit({bool initialValue = false}) : super(initialValue);

  void toggle(bool value) => emit(value);
}
