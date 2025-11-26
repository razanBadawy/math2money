import 'package:flutter/material.dart';
import 'package:math2money/widgets/calc_button.widget.dart';

class CalcButtonsWidget extends StatelessWidget {
  final bool isOperation;
  const CalcButtonsWidget({super.key, required this.isOperation});

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
            if (isOperation == true) ...[
              SizedBox(width: 20),

              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.grey,
                content: '()',
              ),

              SizedBox(width: 20),

              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.grey,
                content: '%',
              ),

              SizedBox(width: 20),

              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.grey,
                content: '÷',
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
            if (isOperation == true) ...[
              SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.grey,
                content: 'x',
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
            if (isOperation == true) ...[
              SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.grey,
                content: '-',
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
            if (isOperation == true) ...[
              SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Color(0xff66ff7f),
                boxColor: Colors.grey,
                content: '+',
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
              ),
              SizedBox(width: 20),
            ],

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

            if (isOperation == true) ...[
              SizedBox(width: 20),
              CalcButtonWidget(
                labelColor: Colors.black,
                boxColor: Color(0xff66ff7f),
                content: '=',
              ),
            ],
          ],
        ),
      ],
    );
  }
}
