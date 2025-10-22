import 'package:flutter_bloc/flutter_bloc.dart';

class ProgramFilterCubit extends Cubit<int> {
  ProgramFilterCubit() : super(0);

  void selectFilter(int index) => emit(index);
}
