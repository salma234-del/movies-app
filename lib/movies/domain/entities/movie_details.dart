import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String? backdropPath;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final List<Genres> genres;

  const MovieDetails(
      {
      required this.id,
      this.backdropPath,
      required this.title,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate,
      required this.runtime,
      required this.genres});
  @override
  List<Object?> get props => [
        id,
        backdropPath,
        title,
        overview,
        voteAverage,
        releaseDate,
        runtime,
        genres,
      ];
}
