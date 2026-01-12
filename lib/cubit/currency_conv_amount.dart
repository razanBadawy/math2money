import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyConvAmountCubit extends Cubit<String> {
  CurrencyConvAmountCubit() : super('0');

  static const double usdPerEgp = 0.02;
  String _amountText = '0';
  String get amountText => _amountText;

  String get resultText {
    if (state == '0') return '0';
    final parts = state.split('-');
    if (parts.isEmpty) return '0';
    return parts[0];
  }

  String get resultCurrency {
    if (!state.contains('-')) return '';
    final parts = state.split('-');
    if (parts.length < 2) return '';
    return parts[1];
  }

  void setAmount({required bool isEgp, required double amount}) {
    String resultText;
    String resultCurrency;

    if (isEgp) {
      final usd = amount * usdPerEgp;
      resultText = usd.toStringAsFixed(2);
      resultCurrency = 'USD';
    } else {
      final egp = amount / usdPerEgp;
      resultText = egp.toStringAsFixed(2);
      resultCurrency = 'EGP';
    }

    emit('$resultText-$resultCurrency');
  }

  void clear() {
    _amountText = '0';
    emit('0');
  }

  void updateFromText({required bool isEgp, required String rawText}) {
    final trimmed = rawText.trim();

    if (trimmed.isEmpty) {
      _amountText = '0';
      setAmount(isEgp: isEgp, amount: 0.0);
      return;
    }

    final normalized = trimmed.replaceAll(',', '.');

    if (normalized == '.') {
      _amountText = '0.';

      setAmount(isEgp: isEgp, amount: 0.0);
      return;
    }

    final amount = double.tryParse(normalized);

    if (amount == null) {
      _amountText = rawText;
      emit(state);
      return;
    }

    _amountText = normalized;
    setAmount(isEgp: isEgp, amount: amount);
  }

  void recalcForDirection({required bool isEgp}) {
    updateFromText(isEgp: isEgp, rawText: _amountText);
  }
}
