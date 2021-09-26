part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabChangedEvent extends MovieTabbedEvent {
  final int? currentTabIndex;

  MovieTabChangedEvent({this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex!];
}