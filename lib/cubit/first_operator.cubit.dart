import 'package:flutter_bloc/flutter_bloc.dart';

class FirstOperatorCubit extends Cubit<int> {
  FirstOperatorCubit() : super(0);

  void add({required String value}) {
    if (state == 0) {
      emit(int.parse(value));
      return;
    } else {
      final String newValue = state.toString() + value;
      emit(int.parse(newValue));
    }
  }

  clear() {
    emit(0);
  }
}
