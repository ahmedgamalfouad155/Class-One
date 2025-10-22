import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationFilterCubit extends Cubit<int> {
  SpecializationFilterCubit() : super(0);

  void selectFilter(int index) => emit(index);
}
