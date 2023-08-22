import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/movie_entity.dart';
import '../model/movie_api_model.dart';

final movieRemoteDataSourceProvider = Provider((ref) => MovieRemoteDataSource(
      ref.read(httpServiceProvider),
      ref.read(userSharedPrefsProvider),
    ));

class MovieRemoteDataSource {
  final Dio _dio;
  final UserSharedPrefs _userSharedPrefs;

  MovieRemoteDataSource(this._dio, this._userSharedPrefs);

  // get all movies

  Future<Either<Failure, List<MovieEntity>>> getAllMovies() async {
    try {
      String? token;

      var data = await _userSharedPrefs.getToken();
      data.fold((l) => token = null, (r) => token = r!);
      var response = await _dio.get(
        ApiEndpoints.getAllMovies,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        // var data = response.data;

        // List<MovieApiModel> movies = [];
        // data.forEach((v) {
        //   movies.add(MovieApiModel.fromJson(v));
        // });

        // return Right(movies.map((e) => e.toEntity()).toList());

        List<MovieEntity> restaurantList = (response.data as List<dynamic>)
            .map<MovieEntity>((json) => MovieEntity.fromJson(json))
            .toList();

        return Right(restaurantList);
      } else {
        return Left(
          Failure(
            error: response.data['error'].toString(),
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

  // add movie
  Future<Either<Failure, MovieEntity>> addMovie(MovieEntity movieEntity) async {
    try {
      String? token;

      var data = await _userSharedPrefs.getToken();
      data.fold((l) => token = null, (r) => token = r!);
      var response = await _dio.post(
        ApiEndpoints.getAllMovies,
        data: {
          'title': movieEntity.title,
          'description': movieEntity.description,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        var data = response.data;

        // convert json to object
        MovieApiModel movie = MovieApiModel.fromJson(data);

        // convert object to entity
        MovieEntity movi = movie.toEntity();
        return Right(movi);
      } else {
        return Left(
          Failure(
            error: response.data['error'].toString(),
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
