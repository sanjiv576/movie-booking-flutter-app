import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket_booking/core/common/widget/toast_message.dart';
import 'package:movie_ticket_booking/features/movies/domain/entity/movie_entity.dart';

import '../../domain/use_case/movie_use_case.dart';
import '../state/movie_state.dart';

final movieViewModelProvider =
    StateNotifierProvider<MovieViewModel, MovieState>(
  (ref) => MovieViewModel(ref.read(movieUseCaseProvider)),
);

class MovieViewModel extends StateNotifier<MovieState> {
  final MovieUseCase _movieUseCase;

  MovieViewModel(this._movieUseCase) : super(MovieState.initial()) {
    getAllMovies();
  }

  Future<void> getAllMovies() async {
    state = state.copyWith(isLoading: true);
    var data = await _movieUseCase.getAllMovies();

    data.fold((l) => state = state.copyWith(isLoading: false, error: l.error),
        (movies) {
      state = state.copyWith(isLoading: false, allMovies: movies, error: null);
    });
  }

  Future<void> addMovie(MovieEntity movieEntity) async {
    state = state.copyWith(isLoading: true);
    var data = await _movieUseCase.addMovie(movieEntity);

    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showToastMessage(message: l.error);
    }, (addedMovieEntity) {
      state = state.copyWith(
          isLoading: false,
          error: null,
          allMovies: [...state.allMovies, addedMovieEntity]);
      showToastMessage(message: 'Movie added successfully');
    });
  }
}
