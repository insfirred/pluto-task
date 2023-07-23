import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_events.dart';
import '../bloc/home/home_states.dart';
import '../bloc/track_details/track_details_bloc.dart';
import '../models/track.dart';
import '../repositories/track_repository.dart';
import 'track_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(FetchTracksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All songs',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade200,
        elevation: 2,
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 15),
                      Text('Fetching your favourite songs...')
                    ],
                  ),
                ),
              );
            }

            if (state is HomeLoadedState) {
              return TracksList(state.tracksList);
            }

            return const Center(
              child: Text('Error while fetching the data. Try again later.'),
            );
          },
        ),
      ),
    );
  }
}

class TracksList extends StatelessWidget {
  final List<Track> tracksList;

  const TracksList(
    this.tracksList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tracksList.length,
      itemBuilder: (context, index) => TrackItem(track: tracksList[index]),
    );
  }
}

class TrackItem extends StatelessWidget {
  const TrackItem({
    super.key,
    required this.track,
  });

  final Track track;

  @override
  Widget build(BuildContext context) {
    TrackRepository trackRepository = TrackRepository(
      trackId: track.id.toString(),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        title: Text(track.name),
        subtitle: Text(track.artist),
        tileColor: Colors.pink.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => BlocProvider(
                  create: (context) => TrackDetailsBloc(trackRepository),
                  child: TrackDetailsScreen(track.id.toString())),
            ),
          );
        },
      ),
    );
  }
}
