import 'package:intl/intl.dart';

String formatMoney(double amount) {
  final formatter = NumberFormat.currency(
    symbol: 'P ',
    decimalDigits: 2,
  );

  return formatter.format(amount);
}
