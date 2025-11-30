import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/cubit/currency_conv_amount.dart';
import 'package:math2money/cubit/currency_conv_isegp.dart';
import 'package:math2money/cubit/first_operator.cubit.dart';
import 'package:math2money/cubit/operation.cubit.dart';
import 'package:math2money/cubit/second_operator.cubit.dart';
import 'package:math2money/widgets/calc_buttons.widget.dart';
import 'package:math2money/widgets/conv_result.widget.dart';
import 'package:math2money/widgets/from_button.widget.dart';
import 'package:math2money/widgets/to_button.widget.dart';

class CurrencyConvertorScreen extends StatelessWidget {
  const CurrencyConvertorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight - 446;
    final currencyConvAmountCubit = CurrencyConvAmountCubit();
    final currencyConvIsegpCubit = CurrencyConvIsegp();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        extendBody: true,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<CurrencyConvAmountCubit>(
              create: (ctx) => currencyConvAmountCubit,
            ),
            BlocProvider<CurrencyConvIsegp>(
              create: (ctx) => currencyConvIsegpCubit,
            ),
          ],
          child: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                height: headerHeight,
                child: SingleChildScrollView(
                  child: BlocBuilder<CurrencyConvIsegp, bool>(
                    builder: (ctx, isEgpToUsd) {
                      return BlocBuilder<CurrencyConvAmountCubit, String>(
                        builder: (ctx, state) {
                          final directionCubit = ctx.read<CurrencyConvIsegp>();
                          final amountCubit = ctx
                              .read<CurrencyConvAmountCubit>();
                          final fromLabel = directionCubit.fromLabel;
                          final toLabel = directionCubit.toLabel;
                          final amountText = amountCubit.amountText;
                          final resultText = amountCubit.resultText;
                          final resultCurrency = amountCubit.resultCurrency;
                          return Column(
                            children: [
                              FromButtonWidget(
                                amountText: amountText,
                                currencyLabel: fromLabel,
                                onSwap: () {
                                  directionCubit.toggleDirection();
                                  final newIsEgpToUsd = directionCubit.state;
                                  amountCubit.recalcForDirection(
                                    isEgp: newIsEgpToUsd,
                                  );
                                },
                              ),
                              ToButtonWidget(currencyLabel: toLabel),
                              ConvResultWidget(
                                resultText: resultText.isEmpty
                                    ? '0.00'
                                    : resultText,
                                currencyCode: resultCurrency.isEmpty
                                    ? directionCubit.toLabel
                                    : resultCurrency,
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
                  child: Builder(
                    builder: (innerContext) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10.0),
                          const SizedBox(height: 17),
                          CalcButtonsWidget(
                            isOperation: false,
                            firstOperatorCubit: FirstOperatorCubit(),
                            operationCubit: OperationCubit(),
                            secondOperatorCubit: SecondOperatorCubit(),
                            calcCubit: CalcCubit(),
                            calcHistoryCubit: CalcHistoryCubit(),
                            onValueChanged: (text) {
                              final isEgpToUsd = innerContext
                                  .read<CurrencyConvIsegp>()
                                  .state;
                              innerContext
                                  .read<CurrencyConvAmountCubit>()
                                  .updateFromText(
                                    isEgp: isEgpToUsd,
                                    rawText: text,
                                  );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
