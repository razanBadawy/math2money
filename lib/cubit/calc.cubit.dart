import 'package:flutter_bloc/flutter_bloc.dart';

class CalcCubit extends Cubit<int> {
  CalcCubit() : super(0);

  void setResult({
    required int first,
    required int second,
    required String operation,
  }) {
    if (operation == "+") {
      emit(first + second);
    } else if (operation == "-") {
      emit(first - second);
    } else if (operation == "*") {
      emit(first * second);
    } else if (operation == "/") {
      emit(first ~/ second);
    }
  }

  void clear() {
    emit(0);
  }
}
