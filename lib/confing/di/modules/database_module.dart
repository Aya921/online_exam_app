import 'package:exam_app/features/result/local/models/result_model_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';


@module
abstract class DatabaseModule {
  @preResolve
  Future<SharedPreferences> get providesharedPreferences async {
    return await SharedPreferences.getInstance();
  }

  @lazySingleton
  FlutterSecureStorage flutterSecureStorage() {
    return const FlutterSecureStorage();
  }


@preResolve
Future<Isar> provideIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open(
    [ResultModelDtoSchema],
    directory: dir.path,
  );
}



 
}
