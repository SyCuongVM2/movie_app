import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../blocs/loading/loading_bloc.dart';
import '../../../domain/entities/movie_search_params.dart';
import '../../../domain/usecases/search_movies.dart';
import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/movie_entity.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;
  final LoadingBloc loadingBloc;
  
  SearchMovieBloc({
    required this.searchMovies,
    required this.loadingBloc,
  }) : super(SearchMovieInitial());

  @override
  Stream<SearchMovieState> mapEventToState(
    SearchMovieEvent event,
  ) async* {
    if (event is SearchTermChangedEvent) {
      loadingBloc.add(StartLoading());

      if (event.searchTerm.length > 2) {
        yield SearchMovieLoading();

        final Either<AppError, List<MovieEntity>> response =
          await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));

        yield response.fold(
          (l) => SearchMovieError(l.appErrorType),
          (r) => SearchMovieLoaded(r),
        );
      }

      loadingBloc.add(FinishLoading());
    }
  }
}