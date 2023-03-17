import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MoviesDetailsCubit(
    this.getMovieDetailsUseCase,
  ) : super(MoviesDetailsInitialState());

  static MoviesDetailsCubit get(context) => BlocProvider.of(context);

  dynamic movieDetails;

  Future<void> getMovieDetailsData(int movieId) async {
    emit(MovieDetailsLoadingState());
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(id: movieId));

    result.fold(
      (l) {
        debugPrint(l.message);
        emit(MovieDetailsFailureState(error: l.message));
      },
      (r) {
        movieDetails = r;
        emit(MovieDetailsSuccessState());
      },
    );
  }
}
