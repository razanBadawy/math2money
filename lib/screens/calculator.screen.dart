import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';
import 'package:math2money/widgets/calc_buttons.widget.dart';
import 'package:math2money/widgets/operation.widget.dart';
import 'package:math2money/widgets/options.widget.dart';
import 'package:math2money/widgets/solution.widget.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstOperatorCubit = FirstOperatorCubit();
    final operationCubit = OperationCubit();
    final secondOperatorCubit = SecondOperatorCubit();
    final calcCubit = CalcCubit();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<FirstOperatorCubit>(
              create: (context) => firstOperatorCubit,
            ),
            BlocProvider<SecondOperatorCubit>(
              create: (context) => secondOperatorCubit,
            ),

            BlocProvider<OperationCubit>(create: (context) => operationCubit),
            BlocProvider<CalcCubit>(create: (context) => calcCubit),
          ],

          child: Column(
            children: [
              OperationWidget(
                firstOperatorCubit: firstOperatorCubit,
                operationCubit: operationCubit,
                secondOperatorCubit: secondOperatorCubit,
              ),

              // Spacer(),
              SolutionWidget(calcCubit: calcCubit),
              SizedBox(height: 40.0),

              OptionsWidget(isOption: true),

              SizedBox(height: 10.0),
              Divider(thickness: 1.0, color: Colors.grey),
              SizedBox(height: 10),

              CalcButtonsWidget(
                isOperation: true,
                firstOperatorCubit: firstOperatorCubit,
                operationCubit: operationCubit,
                secondOperatorCubit: secondOperatorCubit,
                calcCubit: calcCubit,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
