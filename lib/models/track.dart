import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  @JsonKey(name: 'track_id')
  final int id;
  @JsonKey(name: 'track_name')
  final String name;
  @JsonKey(name: 'track_rating')
  final int rating;
  @JsonKey(name: 'artist_name')
  final String artist;

  const Track({
    required this.id,
    required this.name,
    required this.rating,
    required this.artist,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
