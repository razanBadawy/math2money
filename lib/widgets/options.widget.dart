import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/calc_display.ciubit.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/cubit/calc_options.cubit.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';

class OptionsWidget extends StatelessWidget {
  final bool isOption;
  final FirstOperatorCubit firstOperatorCubit;
  final SecondOperatorCubit secondOperatorCubit;
  final OperationCubit operationCubit;
  final CalcDisplayCubit calcDisplayCubit;
  final CalcOptionsCubit calcOptionsCubit;

  const OptionsWidget({
    super.key,
    required this.isOption,
    required this.firstOperatorCubit,
    required this.secondOperatorCubit,
    required this.operationCubit,
    required this.calcDisplayCubit,
    required this.calcOptionsCubit,
  });

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
            onPressed: calcOptionsCubit.handleSquare,
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
                  ? calcOptionsCubit.handleBackspace
                  : () => context.read<CalcHistoryCubit>().clearHistory(),
            ),
          ),
        ],
      ],
    );
  }
}
