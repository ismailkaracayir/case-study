import 'package:shared_preferences/shared_preferences.dart';

class LocaleAuthService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> saveToken(String token) async {
    try {
      final SharedPreferences prefs = await _prefs;
      prefs.setString('token', token);
      return true;
    } catch (e) {
      print('localeBase error ${e.toString()}');
      return false;
    }
  }

  Future<String> readToken() async {
      final SharedPreferences prefs = await _prefs;
      String token = prefs.getString('token') ?? '';
      return token;
  }
}
