import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../repositories/movie_repository.dart';
import '../../domain/entities/movie_detail_entity.dart';
import '../../domain/entities/movie_params.dart';
import 'usecase.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository movieRepository;

  GetMovieDetail(this.movieRepository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(MovieParams params) async {
    return await movieRepository.getMovieDetail(params.id);
  }
}