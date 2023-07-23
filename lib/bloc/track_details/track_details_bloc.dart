import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch_app/bloc/home/home_events.dart';
import 'package:musixmatch_app/bloc/home/home_states.dart';
import 'package:musixmatch_app/repositories/home_repository.dart';

class TrackDetailsBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  TrackDetailsBloc(this._homeRepository) : super(HomeLoadingState()) {
    on<FetchTracksEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        try {
          final allTracks = await _homeRepository.fetchAllTracks();
          emit(HomeLoadedState(allTracks ?? []));
        } catch (e) {
          emit(HomeErrorState(e.toString()));
        }
      },
    );
  }
}
