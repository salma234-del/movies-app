import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
}
