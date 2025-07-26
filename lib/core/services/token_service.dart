import 'package:exam_app/core/constant/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:injectable/injectable.dart';

@injectable
class TokenService {
  final FlutterSecureStorage _prefs;
  TokenService({required FlutterSecureStorage prefs}) : _prefs = prefs;

  Future<void> deleteToken() async {
    await _prefs.delete(key: Constant.token);
  }

  Future<String?> getToken() async {
    return _prefs.read(key: Constant.token);
  }

  Future<void> saveToken(String token) async {
    await _prefs.write(key: Constant.token, value: token);
  }
}
