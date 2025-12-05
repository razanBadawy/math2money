import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/exchange_rate/exchange_rate.state.dart';
import 'package:math2money/models/exchange_rate.dto.dart';
import 'package:math2money/service/exchange_rate.service.dart';

class ExchangeRateCubit extends Cubit<ExchangeRateState> {
  ExchangeRateCubit() : super(const ExchangeRateInitial());

  Future<void> fetchExchangeRate({String base = 'USD'}) async {
    emit(const ExchangeRateLoading());
    try {
      final ExchangeRateDto dto =
          await ExchangeRateService.getExchangeRate(base: base);
      emit(ExchangeRateSuccess(dto));
    } catch (e) {
      emit(
        ExchangeRateFailure(
          error: e,
          message: e.toString(),
        ),
      );
    }
  }
}
