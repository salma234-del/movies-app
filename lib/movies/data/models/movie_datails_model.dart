import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

import '../../../core/network/api_constants.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
     super.backdropPath,
    required super.title,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.runtime,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        backdropPath: json['backdrop_path'] ?? ApiConstants.imageUrl('/r7Dfg9aRZ78gJsmDlCirIIlNH3d.jpg'),
        title: json['title'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        genres: List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e))),
      );
}
