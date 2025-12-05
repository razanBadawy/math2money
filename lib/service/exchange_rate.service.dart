import 'package:math2money/models/exchange_rate.dto.dart';
import 'package:math2money/models/rates.dto.dart';
import 'package:math2money/service/network.service.dart';

class ExchangeRateService {
  static Future<ExchangeRateDto> getExchangeRate({String base = 'USD'}) async {
    try {
      final raw = await NetworkClientService.get('/latest/$base', {});
      return ExchangeRateDto.fromJson(raw);
    } catch (e) {

      const Map<String, dynamic> mockRates = {
        'USD': 1.0,
        'EGP': 50.0,
        'EUR': 0.92,
        'AED': 3.67,
        'SAR': 3.75,
        'GBP': 0.80,
        'JPY': 150.0,
      };

      final rateDto = RateDto.fromMap(mockRates);

      return ExchangeRateDto(
        provider: 'offline-fallback',
        warningUpgrade: '',
        terms: 'LOCAL DEV ONLY',
        base: 'USD',
        date: DateTime.now(),
        lastUpdated: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        rates: rateDto,
      );
    }
  }
}
