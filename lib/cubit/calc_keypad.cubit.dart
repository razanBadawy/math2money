import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';

class CalcKeypadCubit extends Cubit<void> {
  final FirstOperatorCubit firstOperatorCubit;
  final OperationCubit operationCubit;
  final SecondOperatorCubit secondOperatorCubit;
  final CalcCubit calcCubit;
  final CalcHistoryCubit calcHistoryCubit;

  CalcKeypadCubit({
    required this.firstOperatorCubit,
    required this.operationCubit,
    required this.secondOperatorCubit,
    required this.calcCubit,
    required this.calcHistoryCubit,
  }) : super(null);

  bool get _editingFirst =>
      operationCubit.state == null || operationCubit.state!.isEmpty;

  void pressClear({
    required bool isOperation,
    void Function(String)? onValueChanged,
  }) {
    firstOperatorCubit.clear();
    operationCubit.clear();
    secondOperatorCubit.clear();
    calcCubit.clear();
    if (!isOperation && onValueChanged != null) {
      onValueChanged('0');
    }
  }

  void pressDigit(
    String digit, {
    required bool isOperation,
    void Function(String)? onValueChanged,
  }) {
    if (_editingFirst) {
      firstOperatorCubit.add(value: digit);
      if (!isOperation && onValueChanged != null) {
        onValueChanged(firstOperatorCubit.state.isEmpty
            ? '0'
            : firstOperatorCubit.state);
      }
    } else {
      secondOperatorCubit.add(value: digit);
    }
  }

  void pressDot({
    required bool isOperation,
    void Function(String)? onValueChanged,
  }) {
    if (_editingFirst) {
      firstOperatorCubit.add(value: '.');
      if (!isOperation && onValueChanged != null) {
        onValueChanged(firstOperatorCubit.state.isEmpty
            ? '0'
            : firstOperatorCubit.state);
      }
    } else {
      secondOperatorCubit.add(value: '.');
    }
  }

  void pressOperation(String op) {
    operationCubit.setOperation(operation: op);
  }

  void pressBrackets() {
    final op = operationCubit.state;
    final first = firstOperatorCubit.state;
    final second = secondOperatorCubit.state;

    final hasOp = op != null && op.isNotEmpty;
    final hasSecond = second != null && second.isNotEmpty;

    if (!hasOp) {
      firstOperatorCubit.toggleBrackets();
      return;
    }

    if (!hasSecond) {
      secondOperatorCubit.toggleBrackets();
      return;
    }

    final bool firstOuter = first.startsWith('(') && first.endsWith(')');
    final bool secondOuter = second.startsWith('(') && second.endsWith(')');
    final bool wholePattern =
        first.startsWith('(') &&
        second.endsWith(')') &&
        !firstOuter &&
        !secondOuter;

    if (!firstOuter && !secondOuter && !wholePattern) {
      firstOperatorCubit.toggleBrackets();
    } else if (firstOuter && !secondOuter) {
      firstOperatorCubit.toggleBrackets();
      secondOperatorCubit.toggleBrackets();
    } else if (!firstOuter && secondOuter) {
      final innerSecond = second.substring(1, second.length - 1);
      firstOperatorCubit.setRaw('($first');
      secondOperatorCubit.setRaw('$innerSecond)');
    } else if (wholePattern) {
      firstOperatorCubit.setRaw(first.substring(1));
      secondOperatorCubit.setRaw(second.substring(0, second.length - 1));
    } else {
      if (firstOuter) firstOperatorCubit.toggleBrackets();
      if (secondOuter) secondOperatorCubit.toggleBrackets();
    }
  }

  void pressToggleSign() {
    final op = operationCubit.state;
    final second = secondOperatorCubit.state;
    final hasOp = op != null && op.isNotEmpty;
    final hasSecond = second != null && second.isNotEmpty;

    if (!hasOp) {
      firstOperatorCubit.toggleSign();
      return;
    }

    if (!hasSecond) {
      secondOperatorCubit.toggleSign();
      return;
    }

    final first = firstOperatorCubit.state;
    final secondVal = second;

    bool firstNeg = first.startsWith('-');
    bool secondNeg = secondVal.startsWith('-');

    String addMinus(String s) => s.startsWith('-') ? s : '-$s';
    String removeMinus(String s) => s.startsWith('-') ? s.substring(1) : s;

    if (!firstNeg && !secondNeg) {
      firstOperatorCubit.setRaw(addMinus(first));
    } else if (firstNeg && !secondNeg) {
      firstOperatorCubit.setRaw(removeMinus(first));
      secondOperatorCubit.setRaw(addMinus(secondVal));
    } else if (!firstNeg && secondNeg) {
      firstOperatorCubit.setRaw(addMinus(first));
      secondOperatorCubit.setRaw(addMinus(secondVal));
    } else {
      firstOperatorCubit.setRaw(removeMinus(first));
      secondOperatorCubit.setRaw(removeMinus(secondVal));
    }
  }

  void pressBackspace(void Function(String)? onValueChanged) {
    final current = firstOperatorCubit.state;
    if (current.isNotEmpty) {
      final newVal =
          current.length == 1 ? '' : current.substring(0, current.length - 1);
      firstOperatorCubit.setRaw(newVal);
      if (onValueChanged != null) {
        onValueChanged(newVal.isEmpty ? '0' : newVal);
      }
    }
  }

  void pressEquals() {
    calcCubit.setResult(
      first: firstOperatorCubit.state,
      second: secondOperatorCubit.state,
      operation: operationCubit.state,
      calcHistoryCubit: calcHistoryCubit,
    );
  }

  void pressConvert(void Function(String)? onConvert) {
    if (onConvert == null) return;
    final value = firstOperatorCubit.state;
    onConvert(value.isEmpty ? '0' : value);
  }
}
