import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_cubit/movies_details_cubit.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controller/movies_cubit/movies_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    //usecases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

    //cubits
    sl.registerFactory(() => MoviesCubit(sl(), sl(), sl()));
    sl.registerFactory(() => MoviesDetailsCubit(sl()));
  }
}
