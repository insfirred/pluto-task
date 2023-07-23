import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/home_repository.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc(this._homeRepository) : super(HomeLoadingState()) {
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
