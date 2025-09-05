import 'package:intl/intl.dart' show NumberFormat;

// Extension of NumberFormat to currency
extension NumberFormatExtension on NumberFormat {
  static String formatCurrency(String value) {
    final intl = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return intl.format(double.parse(value));
  }
}
