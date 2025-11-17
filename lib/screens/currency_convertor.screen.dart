import 'package:flutter/material.dart';
import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';
import 'package:math2money/widgets/calc_buttons.widget.dart';
import 'package:math2money/widgets/conv_result.widget.dart';
import 'package:math2money/widgets/from_button.widget.dart';
import 'package:math2money/widgets/operation_convertor.widget.dart';
import 'package:math2money/widgets/options.widget.dart';
import 'package:math2money/widgets/to_button.widget.dart';

class CurrencyConvertorScreen extends StatelessWidget {
  const CurrencyConvertorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight - 446;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBody: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox(
              height: headerHeight,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FromButtonWidget(),
                    ToButtonWidget(),
                    ConvResultWidget(),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 446,
                width: screenWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OptionsWidget(isOption: false),

                    SizedBox(height: 10.0),
                    Divider(thickness: 1.0, color: Colors.grey),
                    SizedBox(height: 10),
                    CalcButtonsWidget(
                      isOperation: false,
                      firstOperatorCubit: FirstOperatorCubit(),
                      operationCubit: OperationCubit(),
                      secondOperatorCubit: SecondOperatorCubit(),
                      calcCubit: CalcCubit(),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
