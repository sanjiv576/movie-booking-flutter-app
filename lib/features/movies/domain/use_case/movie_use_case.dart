import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

final movieUseCaseProvider =
    Provider((ref) => MovieUseCase(ref.read(movieRepositoryProvider)));

class MovieUseCase {
  final IMovieRepository _movieRepository;
  MovieUseCase(this._movieRepository);

  Future<Either<Failure, List<MovieEntity>>> getAllMovies() {
    return _movieRepository.getAllMovies();
  }

  Future<Either<Failure, MovieEntity>> addMovie(MovieEntity movieEntity) {
    return _movieRepository.addMovie(movieEntity);
  }
}
