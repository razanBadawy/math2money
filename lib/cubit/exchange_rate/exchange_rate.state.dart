import 'package:math2money/models/exchange_rate.dto.dart';

abstract class ExchangeRateState {
  const ExchangeRateState();
}

class ExchangeRateInitial extends ExchangeRateState {
  const ExchangeRateInitial();
}

class ExchangeRateLoading extends ExchangeRateState {
  const ExchangeRateLoading();
}

class ExchangeRateSuccess extends ExchangeRateState {
  final ExchangeRateDto exchangeRate;
  const ExchangeRateSuccess(this.exchangeRate);
}

class ExchangeRateFailure extends ExchangeRateState {
  final dynamic error;
  final String? message;
  const ExchangeRateFailure({this.error, this.message});
}
