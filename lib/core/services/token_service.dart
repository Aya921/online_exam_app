import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class TokenService {
    final SharedPreferences _prefs;
  TokenService(this._prefs);
  Future<void> deleteToken() async {
    await _prefs.remove(Endpoints.token);
  }
  Future<String?> getToken()async {
    return   _prefs.getString(Endpoints.token);
  }
  Future<void> saveToken(String token)async {
    await  _prefs.setString(Endpoints.token, token);
  }

}