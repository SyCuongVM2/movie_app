import 'package:dartz/dartz.dart';

import '../entities/no_params.dart';
import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetTrending(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getTrending();
  }
}