import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_data.g.dart';

@JsonSerializable()
class TrackData {
  @JsonKey(name: 'track_id')
  final int id;
  @JsonKey(name: 'track_name')
  final String name;
  @JsonKey(name: 'explicit')
  final int isExplicit;
  @JsonKey(name: 'track_rating')
  final int rating;
  @JsonKey(name: 'artist_name')
  final String artist;
  @JsonKey(name: 'num_favourite')
  final int numFavourite;
  @JsonKey(name: 'album_name')
  final String album;
  @JsonKey(name: 'track_share_url')
  final String trackShareUrl;

  const TrackData({
    required this.id,
    required this.name,
    required this.isExplicit,
    required this.rating,
    required this.artist,
    required this.numFavourite,
    required this.album,
    required this.trackShareUrl,
  });

  factory TrackData.fromJson(Map<String, dynamic> json) =>
      _$TrackDataFromJson(json);
}
