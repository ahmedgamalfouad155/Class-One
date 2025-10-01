import 'package:flutter_bloc/flutter_bloc.dart';

class RadioCubit extends Cubit<String?> {
    RadioCubit({String? initialValue}) : super(initialValue);


  void selectTitle(String title) {
    emit(title);
  }
}
