import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/core/local_storage/token/token_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


@Injectable(as: TokenStorage)
class SharedprefrenceTokenStorageImp extends TokenStorage {

  final SharedPreferences _prefs;
  SharedprefrenceTokenStorageImp({required SharedPreferences prefs}) : _prefs = prefs;

 
  @override
  Future<void> deleteToken() async {
    await _prefs.remove(Endpoints.token);
   
   
  }

  @override
  Future<String?> getToken()async {
    return   _prefs.getString(Endpoints.token);
    
  }

  @override
  Future<void> saveToken(String token)async {
    
     await  _prefs.setString(Endpoints.token, token);
   
   
  }

}