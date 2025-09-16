import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String token) async {
    await _prefs?.setString('token', token);
  }

  static String? getToken() {
    String? token = _prefs?.getString('token');
    return token;
  }

  static Future<void> setOnboardingShown(bool value) async {
    await _prefs?.setBool('onboarding_shown', value);
  }

  static bool getOnboardingShown() {
    return _prefs?.getBool('onboarding_shown') ?? false;
  }
}
