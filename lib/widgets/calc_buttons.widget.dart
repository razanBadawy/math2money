import 'package:flutter/material.dart';
import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
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
    required this.calcHistoryCubit,
    this.onValueChanged,
  });
  final FirstOperatorCubit firstOperatorCubit;
  final OperationCubit operationCubit;
  final SecondOperatorCubit secondOperatorCubit;
  final CalcCubit calcCubit;
  final CalcHistoryCubit calcHistoryCubit;
  final void Function(String)? onValueChanged;

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
                if (!isOperation && onValueChanged != null) {
                  onValueChanged!('0');
                }
              },
            ),
            if (isOperation == true) ...[
              SizedBox(width: 20),

              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: '()',
                onTap: () {
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

                  final bool firstOuter =
                      first.startsWith('(') && first.endsWith(')');
                  final bool secondOuter =
                      second.startsWith('(') && second.endsWith(')');
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
                    secondOperatorCubit.setRaw(
                      second.substring(0, second.length - 1),
                    );
                  } else {
                    if (firstOuter) firstOperatorCubit.toggleBrackets();
                    if (secondOuter) secondOperatorCubit.toggleBrackets();
                  }
                },
              ),

              const SizedBox(width: 20),

              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: '%',
                onTap: () => operationCubit.setOperation(operation: '%'),
              ),

              const SizedBox(width: 20),

              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: '÷',
                onTap: () => operationCubit.setOperation(operation: '÷'),
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
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '7');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '7');
                }
              },
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '8',
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '8');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '8');
                }
              },
            ),

            const SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '9',
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '9');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '9');
                }
              },
            ),
            if (isOperation == true) ...[
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: 'x',
                onTap: () => operationCubit.setOperation(operation: 'x'),
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
              boxColor: Colors.white24,
              content: '4',
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '4');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '4');
                }
              },
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '5',
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '5');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '5');
                }
              },
            ),
            const SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '6',
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '6');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '6');
                }
              },
            ),
            if (isOperation == true) ...[
              SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.white24,
                content: '-',
                onTap: () => operationCubit.setOperation(operation: '-'),
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
              boxColor: Colors.white24,
              content: '1',
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '1');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '1');
                }
              },
            ),
            const SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '2',
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '2');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '2');
                }
              },
            ),

            const SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '3',
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '3 ');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '3');
                }
              },
            ),
            if (isOperation == true) ...[
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.white24,
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
                boxColor: Colors.white24,
                content: '+/-',
                onTap: () {
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
                  String removeMinus(String s) =>
                      s.startsWith('-') ? s.substring(1) : s;

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
                },
              ),
              SizedBox(width: 20),
            ],

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '0',
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '0');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '0');
                }
              },
            ),

            const SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.white24,
              content: '.',
              onTap: () {
                if (operationCubit.state == null ||
                    operationCubit.state?.isEmpty == true) {
                  firstOperatorCubit.add(value: '.');
                  if (!isOperation && onValueChanged != null) {
                    onValueChanged!(firstOperatorCubit.state);
                  }
                } else {
                  secondOperatorCubit.add(value: '.');
                }
              },
            ),

            if (!isOperation) ...[
              const SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Colors.white,
                boxColor: Colors.white24,
                content: '⌫',
                onTap: () {
                  final current = firstOperatorCubit.state;
                  if (current.isNotEmpty) {
                    final newVal = current.length == 1
                        ? ''
                        : current.substring(0, current.length - 1);
                    firstOperatorCubit.setRaw(newVal);
                    if (onValueChanged != null) {
                      onValueChanged!(newVal.isEmpty ? '0' : newVal);
                    }
                  }
                },
              ),
            ],

            if (isOperation == true) ...[
              SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Colors.black,
                boxColor: Color(0xff66ff7f),
                content: '=',
                onTap: () => calcCubit.setResult(
                  first: firstOperatorCubit.state,
                  second: secondOperatorCubit.state,
                  operation: operationCubit.state,
                  calcHistoryCubit: calcHistoryCubit,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
