import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/models/rates.dto.dart';

class CurrencyConvAmountCubit extends Cubit<String> {
  CurrencyConvAmountCubit() : super('0');

  String _amountText = '0';
  String _resultText = '0';
  String _resultCurrency = '';
  RateDto? _rates;
  String? _fromCode;
  String? _toCode;

  String get amountText => _amountText;
  String get resultText => _resultText;
  String get resultCurrency => _resultCurrency;

  void clear() {
    _amountText = '0';
    _resultText = '0';
    _resultCurrency = '';
    emit('0');
  }

  void updateRates(RateDto rates) {
    _rates = rates;
  }

  void updateCurrencies({required String from, required String to}) {
    _fromCode = from;
    _toCode = to;
  }

  void updateFromText({required String rawText}) {
    final trimmed = rawText.trim();

    if (trimmed.isEmpty) {
      _amountText = '0';
      emit(_amountText);
      return;
    }

    final normalized = trimmed.replaceAll(',', '.');

    if (normalized == '.') {
      _amountText = '0.';
      emit(_amountText);
      return;
    }

    final amount = double.tryParse(normalized);
    if (amount == null) {
      return;
    }

    _amountText = normalized;
    emit(_amountText);
  }

  void convert() {
    if (_rates == null || _fromCode == null || _toCode == null) {
      _resultText = '0';
      _resultCurrency = _toCode ?? '';
      emit('$_resultText-$_resultCurrency');
      return;
    }

    final map = _rates!.toMap();
    final fromRate = map[_fromCode!.toUpperCase()];
    final toRate = map[_toCode!.toUpperCase()];

    if (fromRate == null || toRate == null || fromRate == 0) {
      _resultText = '0';
      _resultCurrency = _toCode ?? '';
      emit('$_resultText-$_resultCurrency');
      return;
    }

    final amount = double.tryParse(_amountText) ?? 0.0;
    final baseAmount = amount / fromRate;
    final converted = baseAmount * toRate;

    _resultText = converted.toStringAsFixed(2);
    _resultCurrency = _toCode ?? '';
    emit('$_resultText-$_resultCurrency');
  }
}
