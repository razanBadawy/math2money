import 'package:flutter/material.dart';
import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/cubit/calc_keypad.cubit.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';
import 'package:math2money/widgets/calc_button.widget.dart';

class CalcButtonsWidget extends StatelessWidget {
  final bool isOperation;
  final FirstOperatorCubit firstOperatorCubit;
  final OperationCubit operationCubit;
  final SecondOperatorCubit secondOperatorCubit;
  final CalcCubit calcCubit;
  final CalcHistoryCubit calcHistoryCubit;
  final void Function(String)? onValueChanged;
  final void Function(String)? onConvert;

  const CalcButtonsWidget({
    super.key,
    required this.isOperation,
    required this.firstOperatorCubit,
    required this.operationCubit,
    required this.secondOperatorCubit,
    required this.calcCubit,
    required this.calcHistoryCubit,
    this.onValueChanged,
    this.onConvert,
  });

  @override
  Widget build(BuildContext context) {
    final keypadCubit = CalcKeypadCubit(
      firstOperatorCubit: firstOperatorCubit,
      operationCubit: operationCubit,
      secondOperatorCubit: secondOperatorCubit,
      calcCubit: calcCubit,
      calcHistoryCubit: calcHistoryCubit,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButtonWidget(
              labelColor: Colors.black,
              boxColor: Colors.red,
              content: 'C',
              onTap: () => keypadCubit.pressClear(
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            if (!isOperation) ...[
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Colors.black,
                boxColor: const Color(0xff66ff7f),
                content: 'Conv',
                onTap: () => keypadCubit.pressConvert(onConvert),
              ),
            ],
            if (isOperation == true) ...[
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: const Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: '()',
                onTap: keypadCubit.pressBrackets,
              ),
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: const Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: '%',
                onTap: () => keypadCubit.pressOperation('%'),
              ),
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: const Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: '÷',
                onTap: () => keypadCubit.pressOperation('÷'),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '7',
              onTap: () => keypadCubit.pressDigit(
                '7',
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            const SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '8',
              onTap: () => keypadCubit.pressDigit(
                '8',
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            const SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '9',
              onTap: () => keypadCubit.pressDigit(
                '9',
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            if (isOperation == true) ...[
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: const Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: 'x',
                onTap: () => keypadCubit.pressOperation('x'),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '4',
              onTap: () => keypadCubit.pressDigit(
                '4',
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            const SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '5',
              onTap: () => keypadCubit.pressDigit(
                '5',
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            const SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '6',
              onTap: () => keypadCubit.pressDigit(
                '6',
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            if (isOperation == true) ...[
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: const Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: '-',
                onTap: () => keypadCubit.pressOperation('-'),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '1',
              onTap: () => keypadCubit.pressDigit(
                '1',
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            const SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '2',
              onTap: () => keypadCubit.pressDigit(
                '2',
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            const SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '3',
              onTap: () => keypadCubit.pressDigit(
                '3',
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            if (isOperation == true) ...[
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: const Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: '+',
                onTap: () => keypadCubit.pressOperation('+'),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (isOperation == true) ...[
              CalcButtonWidget(
                labelColor: Colors.white,
                boxColor: Colors.white24,
                content: '+/-',
                onTap: keypadCubit.pressToggleSign,
              ),
              const SizedBox(width: 20),
            ],
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '0',
              onTap: () => keypadCubit.pressDigit(
                '0',
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            const SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '.',
              onTap: () => keypadCubit.pressDot(
                isOperation: isOperation,
                onValueChanged: onValueChanged,
              ),
            ),
            if (!isOperation) ...[
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Colors.white,
                boxColor: Colors.white24,
                content: '⌫',
                onTap: () => keypadCubit.pressBackspace(onValueChanged),
              ),
            ],
            if (isOperation == true) ...[
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Colors.black,
                boxColor: const Color(0xff66ff7f),
                content: '=',
                onTap: keypadCubit.pressEquals,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
