import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../blocs/loading/loading_bloc.dart';
import '../../../domain/entities/app_error.dart';
import '../../../presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_trending.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;
  final LoadingBloc loadingBloc;
  
  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc,
    required this.loadingBloc,
  }) : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event
  ) async* {
    if (event is CarouselLoadEvent) {
      loadingBloc.add(StartLoading());

      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold(
        (error) => MovieCarouselError(error.appErrorType), 
        (movies) {
          movieBackdropBloc.add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        }
      );
      loadingBloc.add(FinishLoading());
    }
  }
}