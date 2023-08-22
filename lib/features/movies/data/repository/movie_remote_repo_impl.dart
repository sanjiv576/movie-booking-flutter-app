import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/repository/movie_repository.dart';
import '../data_sources/movie_remote_data_source.dart';

final movieRemoteRepoProvider = Provider<IMovieRepository>(
    (ref) => MovieRemoteRepoImpl(ref.read(movieRemoteDataSourceProvider)));

class MovieRemoteRepoImpl implements IMovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;

  MovieRemoteRepoImpl(this._movieRemoteDataSource);
  @override
  Future<Either<Failure, List<MovieEntity>>> getAllMovies() {
    return _movieRemoteDataSource.getAllMovies();
  }
  
  @override
  Future<Either<Failure, MovieEntity>> addMovie(MovieEntity movieEntity) {
    return _movieRemoteDataSource.addMovie(movieEntity);
  }
}
