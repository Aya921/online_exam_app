import 'package:exam_app/core/constant/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenService {
    final FlutterSecureStorage _prefs;
  TokenService(this._prefs);
  Future<void> deleteToken() async {
    await _prefs.delete( key: Constants.token,);
  }
  Future<String?> getToken()async {
    return   _prefs.read(key:Constants.token);
  }
  Future<void> saveToken(String token)async {
    await  _prefs.write(key:Constants.token, value: token);
  }

}