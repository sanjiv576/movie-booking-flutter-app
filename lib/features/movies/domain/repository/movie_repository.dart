import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/data_sources/movie_remote_data_source.dart';
import '../../data/repository/movie_remote_repo_impl.dart';
import '../entity/movie_entity.dart';

final movieRepositoryProvider = Provider<IMovieRepository>(
    (ref) => MovieRemoteRepoImpl(ref.read(movieRemoteDataSourceProvider)));

abstract class IMovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getAllMovies();
  Future<Either<Failure, MovieEntity>> addMovie(MovieEntity movieEntity);
}
