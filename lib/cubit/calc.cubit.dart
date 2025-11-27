import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/models/calc_history.model.dart';

class CalcCubit extends Cubit<String> {
  CalcCubit() : super('0');

  double _parseBase(String s) {
    final cleaned = s.replaceAll('(', '').replaceAll(')', '');
    if (cleaned.isEmpty) return 0;
    return double.tryParse(cleaned) ?? 0;
  }

  double _parseOperand(String s) {
    if (s.endsWith('²')) {
      final core = s.substring(0, s.length - 1);
      final v = _parseBase(core);
      return v * v;
    }
    return _parseBase(s);
  }

  double _eval(double a, double b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case 'x':
        return a * b;
      case '÷':
        return b == 0 ? 0 : a / b;
      case '%':
        return a % b;
      default:
        return a;
    }
  }

  bool _hasBalancedParentheses(String expr) {
    expr = expr.replaceAll('²', '');
    int balance = 0;
    for (int i = 0; i < expr.length; i++) {
      final ch = expr[i];
      if (ch == '(') {
        balance++;
      } else if (ch == ')') {
        balance--;
        if (balance < 0) return false;
      }
    }
    return balance == 0;
  }

  void setResult({required String first, String? second, String? operation, required CalcHistoryCubit calcHistoryCubit}) {
    final hasOp = operation != null && operation.isNotEmpty;
    final hasSecond = second != null && second.isNotEmpty;

    final expr = first + (operation ?? '') + (second ?? '');
    if (!_hasBalancedParentheses(expr)) {
      return;
    }

    if (hasOp && !hasSecond) {
      return;
    }

    if (!hasOp || !hasSecond) {
      final r = _parseOperand(first);
      if (r % 1 == 0) {
        emit(r.toInt().toString());
      } else {
        emit(r.toString());
      }
      return;
    }


    final bool wholeSquared = first.startsWith('(') && second.endsWith(')²');

    double result;

    if (wholeSquared) {
      final innerFirst = first.substring(1);
      final innerSecond = second.substring(0, second.length - 2);
      final a = _parseBase(innerFirst);
      final b = _parseBase(innerSecond);
      final exprVal = _eval(a, b, operation);
      result = exprVal * exprVal;
    } else {
      final a = _parseOperand(first);
      final b = _parseOperand(second);
      result = _eval(a, b, operation);
    }


    if (result % 1 == 0) {
      emit(result.toInt().toString());
    } else {
      emit(result.toString());
    }
    calcHistoryCubit.addToHistory( CalcHistoryModel(
      operation: expr,
      result: state,
    ));


  }

  void clear() {
    emit('0');
  }
}
