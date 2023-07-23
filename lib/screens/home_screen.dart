import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch_app/screens/track_details_screen.dart';

import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_events.dart';
import '../bloc/home/home_states.dart';
import '../models/track.dart';

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
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HomeLoadedState) {
              return TracksList(state.tracksList);
            }

            return const Center(
              child: Text('Error'),
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
              builder: (context) => const TrackDetailsScreen(),
            ),
          );
        },
      ),
    );
  }
}