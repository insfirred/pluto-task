import '../../models/lyrics.dart';
import '../../models/track_data.dart';

abstract class TrackDetailsState {}

class TrackDetailsLoadingState extends TrackDetailsState {}

class TrackDetailsLoadedState extends TrackDetailsState {
  final TrackData trackData;
  final Lyrics lyrics;
  TrackDetailsLoadedState({
    required this.trackData,
    required this.lyrics,
  });
}

class TrackDetailsErrorState extends TrackDetailsState {
  final String errorMessage;
  TrackDetailsErrorState(this.errorMessage);
}
