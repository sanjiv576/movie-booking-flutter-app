import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/user_entity.dart';
import '../model/auth_api_model.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSource(
      ref.read(httpServiceProvider), ref.read(userSharedPrefsProvider)),
);

class AuthRemoteDataSource {
  final Dio _dio;
  final UserSharedPrefs _userSharedPrefs;

  AuthRemoteDataSource(this._dio, this._userSharedPrefs);

  // user login

  Future<Either<Failure, UserEntity>> login(
      String username, String password) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.login,
        data: {
          "username": username,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        // retrieve token
        String token = response.data["token"];
        await _userSharedPrefs.setToken(token);
        // decode JSON object
        final user = AuthApiModel.fromJson(response.data["user"]);
        // final user = UserEntity.fromJson(response.data["user"]);
        // convert JSON object to entity and return it

        return Right(user.toEntity());
      } else {
        return Left(
          Failure(
            error: response.data["error"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, bool>> register(UserEntity user) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.register,
        data: user.toJson(),
      );
      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["error"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
