import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/calc.cubit.dart';

class SolutionWidget extends StatelessWidget {
  const SolutionWidget({super.key, required this.calcCubit});
  final CalcCubit calcCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Container(
        alignment: Alignment.centerRight,
        child: BlocBuilder(
          bloc: calcCubit,
          builder: (context, state) => Text(
            state.toString(),
            style: TextStyle(fontSize: 50, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
