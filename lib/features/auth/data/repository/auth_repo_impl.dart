
import 'package:exam_app/features/auth/data/source/auth_api_service.dart';

import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepoImpl(this._authRemoteDataSource);

  
}
