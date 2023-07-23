import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch_app/models/lyrics.dart';

import '../bloc/track_details/track_details_bloc.dart';
import '../bloc/track_details/track_details_events.dart';
import '../bloc/track_details/track_details_states.dart';
import '../models/track_data.dart';

class TrackDetailsScreen extends StatefulWidget {
  final String trackId;
  const TrackDetailsScreen(
    this.trackId, {
    super.key,
  });

  @override
  State<TrackDetailsScreen> createState() => _TrackDetailsScreenState();
}

class _TrackDetailsScreenState extends State<TrackDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TrackDetailsBloc>(context).add(FetchTrackDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackDetailsBloc, TrackDetailsState>(
      builder: (context, state) {
        if (state is TrackDetailsLoadingState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.pink.shade200,
              elevation: 2,
            ),
            body: SafeArea(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        if (state is TrackDetailsLoadedState) {
          TrackData trackData = state.trackData;
          Lyrics lyrics = state.lyrics;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                trackData.name,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              backgroundColor: Colors.pink.shade200,
              elevation: 2,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsSection(trackData: trackData),
                    LyricsSection(lyrics),
                  ],
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
            backgroundColor: Colors.pink.shade200,
            elevation: 2,
          ),
          body: SafeArea(
            child: const Center(
              child: Text('Error while fetching the data. Try again later.'),
            ),
          ),
        );
      },
    );
  }
}

class LyricsSection extends StatelessWidget {
  final Lyrics lyrics;
  const LyricsSection(
    this.lyrics, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text(
          'Lyrics',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          lyrics.lyrics,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          lyrics.copyright,
          style: TextStyle(
            fontSize: 16,
            color: Colors.brown.shade900,
          ),
        ),
      ],
    );
  }
}

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
    required this.trackData,
  });

  final TrackData trackData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'By ${trackData.artist}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            if (trackData.isExplicit == 1) ...[
              const Icon(
                Icons.e_mobiledata,
                size: 40,
              ),
            ],
          ],
        ),
        const SizedBox(height: 25),
        Text(
          'From Album ${trackData.album}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${trackData.numFavourite} people liked this song',
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Rating ${trackData.rating}/100',
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
