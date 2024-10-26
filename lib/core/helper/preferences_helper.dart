// preferences_helper.dart
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String _isTermsAcceptedKey = 'isTermsAccepted';

  // Save the checkbox state
  static Future<void> setTermsAccepted(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isTermsAcceptedKey, value);
  }

  // Load the checkbox state
  static Future<bool> getTermsAccepted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isTermsAcceptedKey) ?? false;
  }
}
