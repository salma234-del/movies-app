import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.overview,
    required super.genreIds,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        title: json['title'],
        overview: json['overview'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
      );
}
