import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import '../../../domain/entities/movie.dart';

class MoviesStates extends Equatable {
  final Status nowPlayingStatus;
  final List<Movie> nowPlayingMovies;
  final String nowPlayingMessage;

  final Status popularStatus;
  final List<Movie> popularMovies;
  final String popularMessage;

  final Status topRatedStatus;
  final List<Movie> topRatedMovies;
  final String topRatedMessage;

  const MoviesStates({
    this.nowPlayingStatus = Status.initial,
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage = '',
    this.popularStatus = Status.initial,
    this.popularMovies = const [],
    this.popularMessage = '',
    this.topRatedStatus = Status.initial,
    this.topRatedMovies = const [],
    this.topRatedMessage = '',

  });

  MoviesStates copyWith({
    Status? nowPlayingStatus,
    List<Movie>? nowPlayingMovies,
    String? nowPlayingMessage,
    Status? popularStatus,
    List<Movie>? popularMovies,
    String? popularMessage,
     Status? topRatedStatus,
    List<Movie>? topRatedMovies,
    String? topRatedMessage,
  }) {
    return MoviesStates(
      nowPlayingStatus: nowPlayingStatus ?? this.nowPlayingStatus,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularStatus: popularStatus ?? this.popularStatus,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMessage: topRatedMessage ?? this.nowPlayingMessage,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingStatus,
        nowPlayingMovies,
        nowPlayingMessage,
        popularStatus,
        popularMovies,
        popularMessage,
        topRatedStatus,
        topRatedMovies,
        topRatedMessage
      ];
}
