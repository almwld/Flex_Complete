import 'package:intl/intl.dart';

class AppCurrencyUtils {
  static final NumberFormat _yerFormat = NumberFormat('#,##0', 'ar_YE');
  static final NumberFormat _usdFormat = NumberFormat('#,##0.00', 'en_US');

  static String formatYemeniRial(double amount) {
    return '${_yerFormat.format(amount)} ر.ي';
  }

  static String formatUSD(double amount) {
    return '\$${_usdFormat.format(amount)}';
  }

  static String formatAmount(double amount, String currency) {
    switch (currency.toLowerCase()) {
      case 'usd':
      case '\$':
        return formatUSD(amount);
      case 'yer':
      case 'ر.ي':
      default:
        return formatYemeniRial(amount);
    }
  }

  static double? parseAmount(String? amountString) {
    if (amountString == null || amountString.isEmpty) return null;
    try {
      final cleanString = amountString.replaceAll(RegExp(r'[^\d.]'), '');
      return double.parse(cleanString);
    } catch (e) {
      return null;
    }
  }

  static String formatCompact(double amount) {
    if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(1)}K';
    }
    return amount.toStringAsFixed(0);
  }
}
