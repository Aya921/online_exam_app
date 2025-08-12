import 'package:exam_app/core/constant/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class TokenService {
  final FlutterSecureStorage _prefs;
  final SharedPreferences _sharedPreferences;

  TokenService({
    required FlutterSecureStorage prefs,
    required SharedPreferences sharedPreferences,
  }) : _prefs = prefs,
       _sharedPreferences = sharedPreferences;

  bool get isTokenSaved =>
      _sharedPreferences.getBool(Constant.isTokenSaved) ?? false;

  Future<void> deleteToken() async {
    await _sharedPreferences.setBool(Constant.isTokenSaved, false);
    await _prefs.delete(key: Constant.token);
  }

  Future<String?> getToken() async {
    if (!isTokenSaved) return null;
    return _prefs.read(key: Constant.token);
  }

  Future<void> saveToken(String token) async {
    await _sharedPreferences.setBool(Constant.isTokenSaved, true);
    await _prefs.write(key: Constant.token, value: token);
  }
}
