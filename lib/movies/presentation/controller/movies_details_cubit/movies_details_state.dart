// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_details_cubit.dart';

abstract class MoviesDetailsState extends Equatable {
  const MoviesDetailsState();

  @override
  List<Object> get props => [];
}

class MoviesDetailsInitialState extends MoviesDetailsState {}

class MovieDetailsLoadingState extends MoviesDetailsState {}

class MovieDetailsSuccessState extends MoviesDetailsState {}

class MovieDetailsFailureState extends MoviesDetailsState {
  final String error;
  const MovieDetailsFailureState({
    required this.error,
  });  
}
