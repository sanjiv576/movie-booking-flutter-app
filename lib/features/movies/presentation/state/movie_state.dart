import '../../domain/entity/movie_entity.dart';

class MovieState {
  final bool isLoading;
  final List<MovieEntity> allMovies;
  final String? error;
  final MovieEntity? singleMovie;

  MovieState({
    required this.isLoading,
    required this.allMovies,
    this.error,
    this.singleMovie,
  });

  factory MovieState.initial() {
    return MovieState(
      isLoading: false,
      allMovies: [],
      error: null,
      singleMovie: null,
    );
  }

  MovieState copyWith({
    bool? isLoading,
    List<MovieEntity>? allMovies,
    String? error,
    MovieEntity? singleMovie,
  }) {
    return MovieState(
      isLoading: isLoading ?? this.isLoading,
      allMovies: allMovies ?? this.allMovies,
      error: error ?? this.error,
      singleMovie: singleMovie ?? this.singleMovie,
    );
  }
}
