import 'package:flutter/material.dart';
import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';
import 'package:math2money/widgets/calc_button.widget.dart';

class CalcButtonsWidget extends StatelessWidget {
  final bool isOperation;
  const CalcButtonsWidget({
    super.key,
    required this.isOperation,
    required this.firstOperatorCubit,
    required this.operationCubit,
    required this.secondOperatorCubit,
    required this.calcCubit,
  });
  final FirstOperatorCubit firstOperatorCubit;
  final OperationCubit operationCubit;
  final SecondOperatorCubit secondOperatorCubit;
  final CalcCubit calcCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButtonWidget(
              labelColor: Colors.black,
              boxColor: Colors.red,
              content: 'C',
              onTap: () {
                firstOperatorCubit.clear();
                operationCubit.clear();
                secondOperatorCubit.clear();
                calcCubit.clear();
              },
            ),
            if (isOperation == true) ...[
              SizedBox(width: 20),

              CalcButtonWidget(
                labelColor: Color(0xfff66ff7f),
                boxColor: Colors.grey,
                content: '()',
                onTap: () {},
              ),

              SizedBox(width: 20),

              CalcButtonWidget(
                labelColor: Color(0xfff66ff7f),
                boxColor: Colors.grey,
                content: '%',
                onTap: () {},
              ),

              SizedBox(width: 20),

              CalcButtonWidget(
                labelColor: Color(0xfff66ff7f),
                boxColor: Colors.grey,
                content: '÷',
                onTap: () {},
              ),
            ],
          ],
        ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '7',
              onTap: () {},
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '8',
              onTap: () {},
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '9',
              onTap: () {},
            ),
            if (isOperation == true) ...[
              SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Color(0xfff66ff7f),
                boxColor: Colors.grey,
                content: 'x',
                onTap: () {},
              ),
            ],
          ],
        ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '4',
              onTap: () {},
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '5',
              onTap: () {},
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '6',
              onTap: () {},
            ),
            if (isOperation == true) ...[
              SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Color(0xfff66ff7f),
                boxColor: Colors.grey,
                content: '-',
                onTap: () {},
              ),
            ],
          ],
        ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '1',
              onTap: () =>
                  operationCubit.state == null ||
                      operationCubit.state?.isEmpty == true
                  ? firstOperatorCubit.add(value: '1')
                  : secondOperatorCubit.add(value: '1'),
            ),
            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '2',
              onTap: () =>
                  operationCubit.state == null ||
                      operationCubit.state?.isEmpty == true
                  ? firstOperatorCubit.add(value: '2')
                  : secondOperatorCubit.add(value: '2'),
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '3',
              onTap: () {},
            ),
            if (isOperation == true) ...[
              SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Color(0xfff66ff7f),
                boxColor: Colors.grey,
                content: '+',
                onTap: () => operationCubit.setOperation(operation: '+'),
              ),
            ],
          ],
        ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (isOperation == true) ...[
              CalcButtonWidget(
                labelColor: Colors.white,
                boxColor: Colors.grey,
                content: '+/-',
                onTap: () {},
              ),
              SizedBox(width: 20),
            ],

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '0',
              onTap: () =>
                  operationCubit.state == null ||
                      operationCubit.state?.isEmpty == true
                  ? firstOperatorCubit.add(value: '0')
                  : secondOperatorCubit.add(value: '0'),
            ),

            SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '.',
              onTap: () {},
            ),

            if (isOperation == true) ...[
              SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Colors.black,
                boxColor: Color(0xfff66ff7f),
                content: '=',
                onTap: () =>
                    operationCubit.state != null &&
                        secondOperatorCubit.state?.toString().isNotEmpty == true
                    ? calcCubit.setResult(
                        first: firstOperatorCubit.state,
                        second: secondOperatorCubit.state!,
                        operation: operationCubit.state!,
                      )
                    : {},
              ),
            ],
          ],
        ),
      ],
    );
  }
}
