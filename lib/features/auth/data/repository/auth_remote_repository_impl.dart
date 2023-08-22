import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

final authRemoteRepoImplProvider = Provider<IAuthRepository>(
    (ref) => AuthRemoteRepoImpl(ref.read(authRemoteDataSourceProvider)));

class AuthRemoteRepoImpl implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepoImpl(this._authRemoteDataSource);
  @override
  Future<Either<Failure, UserEntity>> login(String username, String password) {
    return _authRemoteDataSource.login(username, password);
  }
  
  @override
  Future<Either<Failure, bool>> register(UserEntity userEntity) {
   return _authRemoteDataSource.register(userEntity);
  }
}
