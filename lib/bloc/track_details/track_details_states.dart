import '../../models/track_data.dart';

abstract class HomeState {}

class TrackDetailsLoadingState extends HomeState {}

class TrackDetailsLoadedState extends HomeState {
  final TrackData trackData;
  TrackDetailsLoadedState(this.trackData);
}

class TrackDetailsErrorState extends HomeState {
  final String errorMessage;
  TrackDetailsErrorState(this.errorMessage);
}
