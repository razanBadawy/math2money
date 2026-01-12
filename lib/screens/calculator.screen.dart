import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/calc_display.ciubit.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/cubit/calc_options.cubit.dart';
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

    final calcOptionsCubit = CalcOptionsCubit(
      firstOperatorCubit: firstOperatorCubit,
      secondOperatorCubit: secondOperatorCubit,
      operationCubit: operationCubit,
    );

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

              const Spacer(),

              SolutionWidget(calcCubit: calcCubit),

              const SizedBox(height: 130.0),

              OptionsWidget(
                isOption: true,
                firstOperatorCubit: firstOperatorCubit,
                secondOperatorCubit: secondOperatorCubit,
                operationCubit: operationCubit,
                calcDisplayCubit: calcDisplayCubit,
                calcOptionsCubit: calcOptionsCubit,
              ),

              const SizedBox(height: 10.0),
              const Divider(thickness: 1.0, color: Colors.grey),
              const SizedBox(height: 10),

              BlocBuilder<CalcDisplayCubit, bool>(
                bloc: calcDisplayCubit,
                builder: (context, state) {
                  if (state) {
                    return CalcButtonsWidget(
                      isOperation: true,
                      firstOperatorCubit: firstOperatorCubit,
                      operationCubit: operationCubit,
                      secondOperatorCubit: secondOperatorCubit,
                      calcCubit: calcCubit,
                      calcHistoryCubit: calcHistoryCubit,
                    );
                  } else {
                    return Expanded(
                      child: CalcHistoryWidget(
                        calcHistoryCubit: calcHistoryCubit,
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
