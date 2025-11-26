import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';

class OperationWidget extends StatelessWidget {
  const OperationWidget({
    super.key,
    required this.firstOperatorCubit,
    required this.operationCubit,
    required this.secondOperatorCubit,
  });

  final FirstOperatorCubit firstOperatorCubit;
  final OperationCubit operationCubit;
  final SecondOperatorCubit secondOperatorCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<FirstOperatorCubit, String>(
            bloc: firstOperatorCubit,
            builder: (context, state) => Text(
              state,
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),

          BlocBuilder<OperationCubit, String?>(
            bloc: operationCubit,
            builder: (context, state) => Text(
              state ?? '',
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),

          BlocBuilder<SecondOperatorCubit, String?>(
            bloc: secondOperatorCubit,
            builder: (context, state) => Text(
              state ?? '',
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
