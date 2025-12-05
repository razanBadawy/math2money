import 'dart:convert';
import 'package:math2money/models/rates.dto.dart';

class ExchangeRateDto {
  final String provider;
  final String warningUpgrade;
  final String terms;
  final String base;
  final DateTime? date;
  final int lastUpdated;
  final RateDto rates;

  ExchangeRateDto({
    required this.provider,
    required this.warningUpgrade,
    required this.terms,
    required this.base,
    required this.date,
    required this.lastUpdated,
    required this.rates,
  });

  factory ExchangeRateDto.fromJson(dynamic raw) {
   
    late Map<String, dynamic> json;

    if (raw is String) {
      final trimmed = raw.trimLeft();

      if (trimmed.startsWith('<!DOCTYPE html') || trimmed.startsWith('<html')) {
        throw FormatException(
        
          'Check the URL / API key / query parameters.',
        );
      }

      json = jsonDecode(raw) as Map<String, dynamic>;
    } else if (raw is Map<String, dynamic>) {
      json = raw;
    } else {
      throw ArgumentError(
        'ExchangeRateDto.fromJson expects Map or String but got ${raw.runtimeType}',
      );
    }

 
    final provider = (json['provider'] ?? json['license'] ?? '').toString();
    final warning = (json['WARNING_UPGRADE_TO_V6'] ?? json['warning'] ?? '')
        .toString();
    final terms = (json['terms'] ?? json['disclaimer'] ?? '').toString();
    final base =
        (json['base'] ?? json['base_code'] ?? json['base_currency'] ?? 'USD')
            .toString();

    DateTime? parsedDate;
    final dateRaw = json['date'] ?? json['time_last_update_utc'];
    if (dateRaw is String) {
      parsedDate = DateTime.tryParse(dateRaw);
    }

    final lastRaw =
        json['time_last_updated'] ??
        json['time_last_update_unix'] ??
        json['timestamp'];
    int lastUpdated;
    if (lastRaw is int) {
      lastUpdated = lastRaw;
    } else if (lastRaw is num) {
      lastUpdated = lastRaw.toInt();
    } else if (lastRaw is String) {
      lastUpdated = int.tryParse(lastRaw) ?? 0;
    } else {
      lastUpdated = 0;
    }

    dynamic rawRates = json['rates'] ?? json['conversion_rates'];

    if (rawRates is String) {
      rawRates = jsonDecode(rawRates);
    }
    if (rawRates is! Map<String, dynamic>) {
      rawRates = <String, dynamic>{};
    }

    final rates = RateDto.fromMap(rawRates);

    return ExchangeRateDto(
      provider: provider,
      warningUpgrade: warning,
      terms: terms,
      base: base,
      date: parsedDate,
      lastUpdated: lastUpdated,
      rates: rates,
    );
  }
}
