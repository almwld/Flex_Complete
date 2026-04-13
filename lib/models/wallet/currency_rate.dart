/// نموذج أسعار العملات
class CurrencyRateModel {
  final String id;
  final String fromCurrency;
  final String toCurrency;
  final double rate;
  final double buyRate;
  final double sellRate;
  final DateTime lastUpdated;
  final String source;

  CurrencyRateModel({
    required this.id,
    required this.fromCurrency,
    required this.toCurrency,
    required this.rate,
    required this.buyRate,
    required this.sellRate,
    required this.lastUpdated,
    required this.source,
  });

  factory CurrencyRateModel.fromJson(Map<String, dynamic> json) {
    return CurrencyRateModel(
      id: json['id'] ?? '',
      fromCurrency: json['from_currency'] ?? '',
      toCurrency: json['to_currency'] ?? '',
      rate: (json['rate'] ?? 0).toDouble(),
      buyRate: (json['buy_rate'] ?? 0).toDouble(),
      sellRate: (json['sell_rate'] ?? 0).toDouble(),
      lastUpdated: DateTime.parse(json['last_updated'] ?? DateTime.now().toIso8601String()),
      source: json['source'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'from_currency': fromCurrency,
      'to_currency': toCurrency,
      'rate': rate,
      'buy_rate': buyRate,
      'sell_rate': sellRate,
      'last_updated': lastUpdated.toIso8601String(),
      'source': source,
    };
  }

  double convert(double amount) {
    return amount * rate;
  }
}

/// أنواع العملات المدعومة
class SupportedCurrency {
  static const String yemeniRial = 'YER';
  static const String usDollar = 'USD';
  static const String saudiRial = 'SAR';
  static const String emiratiDirham = 'AED';
  static const String euro = 'EUR';

  static const List<String> all = [
    yemeniRial,
    usDollar,
    saudiRial,
    emiratiDirham,
    euro,
  ];

  static const Map<String, String> symbols = {
    yemeniRial: 'ر.ي',
    usDollar: '\$',
    saudiRial: 'ر.س',
    emiratiDirham: 'د.إ',
    euro: '€',
  };

  static const Map<String, String> names = {
    yemeniRial: 'الريال اليمني',
    usDollar: 'الدولار الأمريكي',
    saudiRial: 'الريال السعودي',
    emiratiDirham: 'الدرهم الإماراتي',
    euro: 'اليورو',
  };
}
