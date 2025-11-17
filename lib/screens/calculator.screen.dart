import 'package:flutter/material.dart';
import 'package:math2money/widgets/calc_buttons.widget.dart';
import 'package:math2money/widgets/operation.widget.dart';
import 'package:math2money/widgets/options.widget.dart';
import 'package:math2money/widgets/solution.widget.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            OperationWidget(),
            Spacer(),

            SolutionWidget(),
            SizedBox(height: 40.0),

            OptionsWidget(isOption: true,),

            SizedBox(height: 10.0),
            Divider(thickness: 1.0, color: Colors.grey),
            SizedBox(height: 10),

            CalcButtonsWidget(isOperation: true),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
