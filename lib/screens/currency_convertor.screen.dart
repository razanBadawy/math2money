import 'package:flutter/material.dart';
import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';
import 'package:math2money/widgets/calc_buttons.widget.dart';
import 'package:math2money/widgets/conv_result.widget.dart';
import 'package:math2money/widgets/from_button.widget.dart';
import 'package:math2money/widgets/to_button.widget.dart';

class CurrencyConvertorScreen extends StatelessWidget {
  CurrencyConvertorScreen({super.key});

  final ValueNotifier<String> amountNotifier = ValueNotifier<String>('0');
  final ValueNotifier<bool> isEgpToUsdNotifier = ValueNotifier<bool>(true);
  static const double usdPerEgp = 0.02;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight - 446;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        extendBody: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox(
              height: headerHeight,
              child: SingleChildScrollView(
                child: ValueListenableBuilder<bool>(
                  valueListenable: isEgpToUsdNotifier,
                  builder: (context, isEgpToUsd, _) {
                    return ValueListenableBuilder<String>(
                      valueListenable: amountNotifier,
                      builder: (context, value, __) {
                        final amount = double.tryParse(value) ?? 0;

                        String fromLabel;
                        String toLabel;
                        String resultText;
                        String resultCurrency;

                        if (isEgpToUsd) {
                          fromLabel = 'EGP - Egyptian Pound';
                          toLabel = 'USD - Dollars';
                          final usd = amount * usdPerEgp;
                          resultText = usd.toStringAsFixed(2);
                          resultCurrency = 'USD';
                        } else {
                          fromLabel = 'USD - Dollars';
                          toLabel = 'EGP - Egyptian Pound';
                          final egp = amount / usdPerEgp;
                          resultText = egp.toStringAsFixed(2);
                          resultCurrency = 'EGP';
                        }

                        return Column(
                          children: [
                            FromButtonWidget(
                              amountText: value,
                              currencyLabel: fromLabel,
                              onSwap: () {
                                isEgpToUsdNotifier.value =
                                    !isEgpToUsdNotifier.value;
                              },
                            ),
                            ToButtonWidget(currencyLabel: toLabel),
                            ConvResultWidget(
                              resultText: resultText,
                              currencyCode: resultCurrency,
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        );
                      },
                    );
                  },
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
                    const SizedBox(height: 10.0),
                    // const Divider(thickness: 1.0, color: Colors.grey),
                    const SizedBox(height: 17),
                    CalcButtonsWidget(
                      isOperation: false,
                      firstOperatorCubit: FirstOperatorCubit(),
                      operationCubit: OperationCubit(),
                      secondOperatorCubit: SecondOperatorCubit(),
                      calcCubit: CalcCubit(),
                      calcHistoryCubit: CalcHistoryCubit(),
                      onValueChanged: (text) {
                        amountNotifier.value = text.isEmpty ? '0' : text;
                      },
                    ),
                    const SizedBox(height: 20),
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
