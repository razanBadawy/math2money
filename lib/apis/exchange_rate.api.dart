import 'package:dio/dio.dart';
import 'package:math2money/models/exchange_rate.dto.dart';

class ExchangeRateService {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  static Future<ExchangeRateDto> getExchangeRate() async {
    const url = 'https://open.er-api.com/v6/latest/USD';

    try {
      final Response response = await _dio.get(url);

      if (response.statusCode != 200) {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.statusMessage ?? ''}',
        );
      }

      final data = response.data;

      return ExchangeRateDto.fromJson(data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw Exception('Cannot reach exchange-rate server. ');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Please try again in a moment.');
      }

      throw Exception(e.message ?? 'Unknown network error');
    }
  }
}
