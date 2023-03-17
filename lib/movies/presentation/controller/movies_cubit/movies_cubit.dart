// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import '../../../domain/usecases/get_now_playing_movies_usecase.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesCubit(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesStates());


  Future<void> getNowPlayingData() async {
    emit(state.copyWith(nowPlayingStatus: Status.loading));

    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
          nowPlayingStatus: Status.failure, nowPlayingMessage: l.message));
    }, (r) {
      emit(state.copyWith(
        nowPlayingMovies: r,
        nowPlayingStatus: Status.success,
      ));
    });
  }

  Future<void> getPopularData() async {
    emit(state.copyWith(popularStatus: Status.loading));

    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
          popularStatus: Status.failure, popularMessage: l.message));
    }, (r) {
      emit(state.copyWith(
        popularMovies: r,
        popularStatus: Status.success,
      ));
    });
  }

   Future<void> getTopRatedData() async {
    emit(state.copyWith(topRatedStatus: Status.loading));

    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
          topRatedStatus: Status.failure, topRatedMessage: l.message));
    }, (r) {
      emit(state.copyWith(
        topRatedMovies: r,
        topRatedStatus: Status.success,
      ));
    });
  }
}
