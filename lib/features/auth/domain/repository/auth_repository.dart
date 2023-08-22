import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/data_sources/auth_remote_data_source.dart';
import '../../data/repository/auth_remote_repository_impl.dart';
import '../entity/user_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>(
    (ref) => AuthRemoteRepoImpl(ref.read(authRemoteDataSourceProvider)));

abstract class IAuthRepository {
  Future<Either<Failure, UserEntity>> login(String username, String password);
  Future<Either<Failure, bool>> register(UserEntity userEntity);
}
