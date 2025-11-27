import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/calc_display.ciubit.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';

class OptionsWidget extends StatelessWidget {
  final bool isOption;
  final FirstOperatorCubit firstOperatorCubit;
  final SecondOperatorCubit secondOperatorCubit;
  final OperationCubit operationCubit;
  final CalcDisplayCubit calcDisplayCubit;

  const OptionsWidget({
    super.key,
    required this.isOption,
    required this.firstOperatorCubit,
    required this.secondOperatorCubit,
    required this.operationCubit,
    required this.calcDisplayCubit,
  });

  void _handleBackspace() {
    final op = operationCubit.state;
    final second = secondOperatorCubit.state;
    final first = firstOperatorCubit.state;

    if (second != null && second.isNotEmpty) {
      final newSecond = second.substring(0, second.length - 1);
      if (newSecond.isEmpty) {
        secondOperatorCubit.clear();
      } else {
        secondOperatorCubit.setRaw(newSecond);
      }
      return;
    }

    if (op != null && op.isNotEmpty) {
      operationCubit.clear();
      return;
    }

    if (first.isNotEmpty && first != '0') {
      final newFirst = first.substring(0, first.length - 1);
      if (newFirst.isEmpty) {
        firstOperatorCubit.clear();
      } else {
        firstOperatorCubit.setRaw(newFirst);
      }
    }
  }

  void _handleSquare() {
    final op = operationCubit.state;
    final first = firstOperatorCubit.state;
    final second = secondOperatorCubit.state;

    final hasOp = op != null && op.isNotEmpty;
    final hasSecond = second != null && second.isNotEmpty;

    String toggleSq(String s) =>
        s.endsWith('²') ? s.substring(0, s.length - 1) : '$s²';

    if (!hasOp) {
      firstOperatorCubit.setRaw(toggleSq(first));
      return;
    }

    if (hasOp && !hasSecond) {
      firstOperatorCubit.setRaw(toggleSq(first));
      return;
    }

    final sec = second!;
    final bool wholePattern =
        first.startsWith('(') &&
        sec.endsWith(')') &&
        !first.endsWith(')') &&
        !sec.startsWith('(');

    if (wholePattern) {
      final toggled = sec.endsWith('²')
          ? sec.substring(0, sec.length - 1)
          : '$sec²';
      secondOperatorCubit.setRaw(toggled);
    } else {
      secondOperatorCubit.setRaw(toggleSq(sec));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isOption == true) ...[
          BlocBuilder<CalcDisplayCubit, bool>(
            bloc: calcDisplayCubit,
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state ? Icons.history : Icons.calculate,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () => calcDisplayCubit.switchDisplay(),
              );
            },
          ),

          IconButton(
            icon: const Icon(
              Icons.superscript,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: _handleSquare,
          ),
          const SizedBox(width: 150.0),
          BlocBuilder<CalcDisplayCubit, bool>(
            bloc: calcDisplayCubit,
            builder: (context, state) => IconButton(
              icon: Icon(
                state ? Icons.arrow_circle_left : Icons.delete,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: state
                  ? _handleBackspace
                  : () => context.read<CalcHistoryCubit>().clearHistory(),
            ),
          ),
        ],
      ],
    );
  }
}
