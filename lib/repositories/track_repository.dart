import 'dart:convert';

import 'package:dio/dio.dart';

import '../api_service/api_service.dart';
import '../constants/constants.dart';
import '../models/lyrics.dart';
import '../models/track_data.dart';

class TrackRepository {
  late final Dio dio;
  late final ApiService _apiService;
  final String trackId;

  TrackRepository({
    required this.trackId,
  }) {
    dio = Dio();
    _apiService = ApiService(dio);
  }

  Future<TrackData?> fetchTrackInfo() async {
    try {
      final response = json.decode(
        await _apiService.fetchTrackInfo(
          trackId: trackId,
          apiKey: apiKey,
        ),
      );
      return TrackData.fromJson(response['message']['body']['track']);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Lyrics?> fetchLyrics() async {
    try {
      final response = json.decode(
        await _apiService.fetchLyrics(
          trackId: trackId,
          apiKey: apiKey,
        ),
      );
      return Lyrics.fromJson(response['message']['body']['lyrics']);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
