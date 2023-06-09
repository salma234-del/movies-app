import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (falure) {
      return Left(ServerFailure(falure.errorMessageModel.statusMessage));
    }
  }
  
  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
     final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (falure) {
      return Left(ServerFailure(falure.errorMessageModel.statusMessage));
    }
  }
  
  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
     final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (falure) {
      return Left(ServerFailure(falure.errorMessageModel.statusMessage));
    }
  }
  
  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
      final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (falure) {
      return Left(ServerFailure(falure.errorMessageModel.statusMessage));
    }
  }
}
