import 'package:intl/intl.dart';

abstract class Utils {
  static String toCopFormat(String value) {
    final formatter = NumberFormat.currency(
      locale: 'es_CO',
      symbol: '\$',
      decimalDigits: 0,
    );

    return formatter.format(double.parse(value));
  }
}
