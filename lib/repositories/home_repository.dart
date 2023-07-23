import 'dart:convert';

import 'package:dio/dio.dart';

import '../api_service/api_service.dart';
import '../constants/constants.dart';
import '../models/track.dart';

class HomeRepository {
  late final Dio dio;
  late final ApiService _apiService;

  HomeRepository() {
    dio = Dio();
    _apiService = ApiService(dio);
  }

  Future<List<Track>?> fetchAllTracks() async {
    try {
      final response =
          json.decode(await _apiService.fetchAllTracks(apiKey: apiKey));
      // print(response['message']['body']['track_list']);
      final tracksJsonList = response['message']['body']['track_list'] as List;

      List<Track> tracksList = tracksJsonList
          .map(
            (track) => Track.fromJson(track['track']),
          )
          .toList();
      return tracksList;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
