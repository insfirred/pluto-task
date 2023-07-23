import '../../models/track.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Track> tracksList;
  HomeLoadedState(this.tracksList);
}

class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}
