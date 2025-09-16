import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    print('SharedPreferences initialized');
  }

  static SharedPreferences get instance {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized");
    }
    return _prefs!;
  }

  static Future<void> setToken(String token) async {
    await instance.setString('token', token);
    print('Token set: $token');
  }

  static String? getToken() {
    String? token = instance.getString('token');
    print('Token fetched: $token');
    return token;
  }

  static Future<void> setOnboardingViewed(bool viewed) async {
    await instance.setBool('onboarding_viewed', viewed);
    print('Onboarding viewed set: $viewed');
  }

  static bool isOnboardingViewed() {
    bool viewed = instance.getBool('onboarding_viewed') ?? false;
    print('Onboarding viewed fetched: $viewed');
    return viewed;
  }

  static Future<void> clearAll() async {
    await instance.clear();
    print('SharedPreferences cleared');
  }
}
