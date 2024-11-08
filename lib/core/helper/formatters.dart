import 'package:flutter/services.dart';

abstract class Formatters {
  static final FilteringTextInputFormatter preventSpaces = FilteringTextInputFormatter.deny(RegExp(' '));

  static final FilteringTextInputFormatter emailOrUsernameRegExp = FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9_@.]"));

  static final FilteringTextInputFormatter emailRegExp = FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9@.]"));

  static final FilteringTextInputFormatter usernamesRegExp = FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9_]"));

  static final FilteringTextInputFormatter pricesRegExp = FilteringTextInputFormatter.allow(RegExp(r"[0-9]*\.?[0-9]*"));

  static final FilteringTextInputFormatter phoneNumbersRegExp = FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'));

  static final TextInputFormatter numbersOnly = FilteringTextInputFormatter.digitsOnly;

  // to prevent user to input price 0.0
  static final TextInputFormatter correctPrice0 = TextInputFormatter.withFunction((oldValue, newValue) {
    if (oldValue.text == '' && newValue.text == '.') {
      return const TextEditingValue(text: '0.');
    } else {
      return newValue;
    }
  });

  static final UpperCaseTextFormatter toUpperCase = UpperCaseTextFormatter();

  static LengthLimitingTextInputFormatter limitInput(int number) {
    return LengthLimitingTextInputFormatter(number);
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
