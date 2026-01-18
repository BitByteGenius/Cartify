import 'package:phone_numbers_parser/phone_numbers_parser.dart';
class TFormatter {
  static String formatCurrency(double amount, {String symbol = '\$'}) {
    return '$symbol${amount.toStringAsFixed(2)}';
  }

  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    // Simple date formatting (you can enhance this with intl package)
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) '
          '${phoneNumber.substring(3, 6)}-'
          '${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 1)}) '
          '${phoneNumber.substring(1, 4)}-'
          '${phoneNumber.substring(4, 7)}-'
          '${phoneNumber.substring(7)}';
    }

    return phoneNumber; // Return as-is if not 10 or 11 digits
  }

  // Not fully tested

 static String internationalFormatPhoneNumber(String phoneNumber,
    {String defaultIsoCode = 'IN'}) {
  try {
    final parsed = PhoneNumber.parse(phoneNumber, destinationCountry: IsoCode.values.firstWhere(
      (e) => e.name == defaultIsoCode,
      orElse: () => IsoCode.IN,
    ));

    return parsed.formatNsn(); // national number format
    // OR use:
    // return parsed.formatInternational();  // international format with +code
  } catch (e) {
    return phoneNumber; // fallback if invalid
  }
}
}
