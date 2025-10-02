import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxCubit extends Cubit<Map<String, bool>> {
  CheckBoxCubit() : super({});

  // toggle checkbox value
  void toggleCheckBox(String title, bool value) {
    final newState = Map<String, bool>.from(state);
    newState[title] = value;
    emit(newState);
  }

  // get selected items
  List<String> getSelectedItems() {
    return state.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();
  }
}
