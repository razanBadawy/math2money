import 'package:flutter_bloc/flutter_bloc.dart';

class SecondOperatorCubit extends Cubit<int?> {
  SecondOperatorCubit() : super(null);

  void add({required String value}) {
    if (state == 0 || state == null) {
      emit(int.parse(value));
      return;
    } else {
      final String newValue = state.toString() + value;
      emit(int.parse(newValue));
    }
  }

  clear() {
    emit(null);
  }
}
