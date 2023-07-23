import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.musixmatch.com/ws/1.1')
abstract class ApiService {
  factory ApiService(
    Dio dio, {
    String baseUrl,
  }) = _ApiService;

  @GET('/chart.tracks.get')
  Future fetchAllTracks({
    @Query('apikey') required String apiKey,
  });

  @GET('/track.get')
  Future fetchTrackInfo({
    @Query('apikey') required String apiKey,
    @Query('track_id') required String trackId,
  });

  @GET('/track.lyrics.get')
  Future fetchLyrics({
    @Query('apikey') required String apiKey,
    @Query('track_id') required String trackId,
  });
}
