import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

final authUseCaseProvider = Provider<AuthUseCase>(
    (ref) => AuthUseCase(ref.read(authRepositoryProvider)));

class AuthUseCase {
  final IAuthRepository _authRepository;
  AuthUseCase(this._authRepository);

  Future<Either<Failure, UserEntity>> login(
      String username, String password) async {
    return await _authRepository.login(username, password);
  }

  Future<Either<Failure, bool>> register(UserEntity userEntity) async {
    return await _authRepository.register(userEntity);
  }
}
