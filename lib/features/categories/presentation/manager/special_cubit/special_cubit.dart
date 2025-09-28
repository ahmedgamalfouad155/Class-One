import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialCubit extends Cubit<int> {
  SpecialCubit() : super(0);

  void selectFilter(int index) => emit(index);
}
