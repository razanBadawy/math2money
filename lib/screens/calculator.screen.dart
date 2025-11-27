import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/calc_display.ciubit.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';
import 'package:math2money/widgets/calc_buttons.widget.dart';
import 'package:math2money/widgets/calc_history.widget.dart';
import 'package:math2money/widgets/operation.widget.dart';
import 'package:math2money/widgets/options.widget.dart';
import 'package:math2money/widgets/solution.widget.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firstOperatorCubit = FirstOperatorCubit();
    final operationCubit = OperationCubit();
    final secondOperatorCubit = SecondOperatorCubit();
    final calcCubit = CalcCubit();
    final calcHistoryCubit = CalcHistoryCubit();
    final calcDisplayCubit = CalcDisplayCubit();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
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
            BlocProvider<CalcHistoryCubit>(
              create: (context) => calcHistoryCubit,
            ),
            BlocProvider<CalcDisplayCubit>(
              create: (context) => calcDisplayCubit,
            ),
          ],

          child: Column(
            children: [
              OperationWidget(
                firstOperatorCubit: firstOperatorCubit,
                operationCubit: operationCubit,
                secondOperatorCubit: secondOperatorCubit,
              ),

              Spacer(),
              SolutionWidget(calcCubit: calcCubit),

              SizedBox(height: 130.0),
              OptionsWidget(
                isOption: true,
                firstOperatorCubit: firstOperatorCubit,
                secondOperatorCubit: secondOperatorCubit,
                operationCubit: operationCubit,
                calcDisplayCubit: calcDisplayCubit,
              ),

              SizedBox(height: 10.0),
              Divider(thickness: 1.0, color: Colors.grey),
              SizedBox(height: 10),
              BlocBuilder(
                bloc: calcDisplayCubit,
                builder: (context, state) => calcDisplayCubit.state == true
                    ? CalcButtonsWidget(
                        isOperation: true,
                        firstOperatorCubit: firstOperatorCubit,
                        operationCubit: operationCubit,
                        secondOperatorCubit: secondOperatorCubit,
                        calcCubit: calcCubit,
                        calcHistoryCubit: calcHistoryCubit,
                      )
                    : Expanded(
                        child: CalcHistoryWidget(
                          calcHistoryCubit: calcHistoryCubit,
                        ),
                      ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
