import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<SharedPreferences> get providesharedPreferences async {

=======
  
  @lazySingleton
  
>>>>>>> a0e25228f58073ce11ce1846d5c2bc5a028299c4:lib/confing/di/modules/database_module.dart
}
}