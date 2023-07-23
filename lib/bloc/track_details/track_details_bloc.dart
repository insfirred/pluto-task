import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/track_repository.dart';
import 'track_details_events.dart';
import 'track_details_states.dart';

class TrackDetailsBloc extends Bloc<TrackDetailsEvent, TrackDetailsState> {
  final TrackRepository _trackRepository;

  TrackDetailsBloc(this._trackRepository) : super(TrackDetailsLoadingState()) {
    on<FetchTrackDetailsEvent>(
      (event, emit) async {
        emit(TrackDetailsLoadingState());
        try {
          final trackDetails = await _trackRepository.fetchTrackInfo();
          final lyrics = await _trackRepository.fetchLyrics();
          emit(TrackDetailsLoadedState(
            trackData: trackDetails!,
            lyrics: lyrics!,
          ));
        } catch (e) {
          emit(TrackDetailsErrorState(e.toString()));
        }
      },
    );
  }
}
