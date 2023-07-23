import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TrackDetailsBloc, TrackDetailsState>(
          builder: (context, state) {
            if (state is TrackDetailsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is TrackDetailsLoadedState) {
              TrackData trackData = state.trackData;
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsSection(trackData: trackData),
                    const SizedBox(height: 30),
                    const Text(
                      'Lyrics',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.lyrics.lyrics,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.lyrics.copyright,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.brown.shade900,
                      ),
                    ),
                  ],
                ),
              );
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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trackData.name,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  trackData.artist,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            if (trackData.isExplicit == 1) ...[
              const Icon(
                Icons.e_mobiledata,
                size: 50,
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
