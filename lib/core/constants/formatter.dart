import 'package:flutter/services.dart';

class AppFormater {
  /// Phone Number Input Formatter
  static List<TextInputFormatter> phoneNumberInputFormatter() {
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(10),
    ];
  }
}
