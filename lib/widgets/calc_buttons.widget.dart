import 'package:flutter/material.dart';
import 'package:math2money/widgets/calc_button.widget.dart';

class CalcButtonsWidget extends StatelessWidget {
  const CalcButtonsWidget({super.key});

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
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Color(0xfff66ff7f),
              boxColor: Colors.grey,
              content: '()',
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Color(0xfff66ff7f),
              boxColor: Colors.grey,
              content: '%',
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Color(0xfff66ff7f),
              boxColor: Colors.grey,
              content: '÷',
            ),
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
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '8',
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '9',
            ),

            SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Color(0xfff66ff7f),
              boxColor: Colors.grey,
              content: 'x',
            ),
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
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '5',
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '6',
            ),

            SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Color(0xfff66ff7f),
              boxColor: Colors.grey,
              content: '-',
            ),
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
            ),
            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '2',
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '3',
            ),

            SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Color(0xfff66ff7f),
              boxColor: Colors.grey,
              content: '+',
            ),
          ],
        ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '+/-',
            ),

            SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '0',
            ),

            SizedBox(width: 20),
            CalcButtonWidget(
              labelColor: Colors.white,
              boxColor: Colors.grey,
              content: '.',
            ),

            SizedBox(width: 20),

            CalcButtonWidget(
              labelColor: Colors.black,
              boxColor: Color(0xfff66ff7f),
              content: '=',
            ),
          ],
        ),
      ],
    );
  }
}
