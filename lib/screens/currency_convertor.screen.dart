import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:math2money/cubit/calc.cubit.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/cubit/currency_conv_amount.dart';
import 'package:math2money/cubit/currency_selection.cubit.dart';
import 'package:math2money/cubit/exchange_rate/exchange_rate.cubit.dart';
import 'package:math2money/cubit/exchange_rate/exchange_rate.state.dart';
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        extendBody: true,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<ExchangeRateCubit>(
              create: (_) => ExchangeRateCubit()..fetchExchangeRate(),
            ),
            BlocProvider<CurrencySelectionCubit>(
              create: (_) => CurrencySelectionCubit(),
            ),
            BlocProvider<CurrencyConvAmountCubit>(
              create: (_) => CurrencyConvAmountCubit(),
            ),
          ],
          child: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                height: headerHeight,
                child: SingleChildScrollView(
                  child: BlocBuilder<ExchangeRateCubit, ExchangeRateState>(
                    builder: (ctx, rateState) {
                      if (rateState is ExchangeRateLoading ||
                          rateState is ExchangeRateInitial) {
                        return const SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      if (rateState is ExchangeRateFailure) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Text(
                              rateState.message ?? 'Failed to load rates',
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }

                      final successState = rateState as ExchangeRateSuccess;
                      final rates = successState.exchangeRate.rates;
                      final currencies = rates.toMap().keys.toList()..sort();

                      return BlocBuilder<CurrencySelectionCubit,
                          CurrencySelectionState>(
                        builder: (ctx, selectionState) {
                          final amountCubit =
                              ctx.read<CurrencyConvAmountCubit>();

                          amountCubit.updateRates(rates);
                          amountCubit.updateCurrencies(
                            from: selectionState.from,
                            to: selectionState.to,
                          );

                          return BlocBuilder<CurrencyConvAmountCubit, String>(
                            builder: (ctx, _) {
                              final amountText = amountCubit.amountText;
                              final resultText = amountCubit.resultText;
                              final resultCurrency =
                                  amountCubit.resultCurrency.isEmpty
                                      ? selectionState.to
                                      : amountCubit.resultCurrency;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  FromButtonWidget(
                                    amountText: amountText,
                                    selectedCurrency: selectionState.from,
                                    currencies: currencies,
                                    onCurrencyChanged: (code) {
                                      ctx
                                          .read<CurrencySelectionCubit>()
                                          .setFrom(code);
                                    },
                                    onSwap: () {
                                      ctx
                                          .read<CurrencySelectionCubit>()
                                          .swap();
                                    },
                                  ),
                                  ToButtonWidget(
                                    selectedCurrency: selectionState.to,
                                    currencies: currencies,
                                    onCurrencyChanged: (code) {
                                      ctx
                                          .read<CurrencySelectionCubit>()
                                          .setTo(code);
                                    },
                                  ),
                                  ConvResultWidget(
                                    resultText: resultText.isEmpty
                                        ? '0.00'
                                        : resultText,
                                    currencyCode: resultCurrency,
                                  ),
                                  const SizedBox(height: 10.0),
                                ],
                              );
                            },
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
                              final amountCubit = innerContext
                                  .read<CurrencyConvAmountCubit>();
                              if (text == '0') {
                                amountCubit.clear();
                              } else {
                                amountCubit.updateFromText(rawText: text);
                              }
                            },
                            onConvert: (text) {
                              final amountCubit = innerContext
                                  .read<CurrencyConvAmountCubit>();
                              amountCubit.updateFromText(rawText: text);
                              amountCubit.convert();
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
