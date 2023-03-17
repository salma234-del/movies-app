// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class BaseUsecase<T, MovieDetailParameters> {
  Future<Either<Failure, T>> call(MovieDetailParameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}

class MovieDetailsParameters extends Equatable {
  final int id;
  const MovieDetailsParameters({
    required this.id,
  });
  
  @override
  List<Object?> get props => [id];
}
