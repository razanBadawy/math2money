import 'package:flutter_bloc/flutter_bloc.dart';

class SecondOperatorCubit extends Cubit<String?> {
  SecondOperatorCubit() : super(null);

  void add({required String value}) {
    String current = state ?? '';

    if (value == '.') {
      if (current.contains('.')) return;

      if (current.isEmpty) {
        emit('0.');
      } else {
        emit('$current.');
      }
      return;
    }

    if (current == '0') {
      emit(value);
    } else {
      emit('$current$value');
    }
  }

  void clear() {
    emit(null);
  }

  void setRaw(String? value) {
    emit(value);
  }

  void toggleSign() {
    final text = state ?? '';

    if (text.isEmpty || text == '0') return;

    if (text.startsWith('-')) {
      emit(text.substring(1));
    } else {
      emit('-$text');
    }
  }

  void toggleBrackets() {
    final text = state ?? '';

    if (text.startsWith('(') && text.endsWith(')') && text.length >= 2) {
      emit(text.substring(1, text.length - 1));
    } else if (text.isNotEmpty && text != '0') {
      emit('($text)');
    }
  }

  double _parse(String? s) {
    final txt = s ?? '';
    final cleaned = txt.replaceAll('(', '').replaceAll(')', '');
    if (cleaned.isEmpty) return 0;
    return double.tryParse(cleaned) ?? 0;
  }

  String _format(double v) {
    if (v % 1 == 0) return v.toInt().toString();
    return v.toString();
  }

  void square() {
    final txt = state;
    if (txt == null || txt.isEmpty) return;
    final v = _parse(txt);
    final sq = v * v;
    emit(_format(sq));
  }
}
