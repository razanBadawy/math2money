import 'package:flutter_bloc/flutter_bloc.dart';

class FirstOperatorCubit extends Cubit<String> {
  FirstOperatorCubit() : super('0');

  void add({required String value}) {
    if (value == '.') {
      if (state.contains('.')) return;

      if (state.isEmpty || state == '0') {
        emit('0.');
      } else {
        emit('$state.');
      }
      return;
    }

    if (state == '0') {
      emit(value);
    } else {
      emit('$state$value');
    }
  }

  void clear() {
    emit('0');
  }

  void setRaw(String value) {
    emit(value);
  }

  void toggleSign() {
    if (state == '0' || state.isEmpty) return;

    if (state.startsWith('-')) {
      emit(state.substring(1));
    } else {
      emit('-$state');
    }
  }

  void toggleBrackets() {
    final text = state;

    if (text.startsWith('(') && text.endsWith(')') && text.length >= 2) {
      emit(text.substring(1, text.length - 1));
    } else if (text.isNotEmpty && text != '0') {
      emit('($text)');
    }
  }

  double _parse(String s) {
    final cleaned = s.replaceAll('(', '').replaceAll(')', '');
    if (cleaned.isEmpty) return 0;
    return double.tryParse(cleaned) ?? 0;
  }

  String _format(double v) {
    if (v % 1 == 0) return v.toInt().toString();
    return v.toString();
  }

  void square() {
    final v = _parse(state);
    final sq = v * v;
    emit(_format(sq));
  }
}
