// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import '../entities/movie_details.dart';

class GetMovieDetailsUseCase extends BaseUsecase<MovieDetails , MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(
     this.baseMoviesRepository,
  );
  
  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async{
    return await baseMoviesRepository.getMovieDetails(parameters);
  } 
}
