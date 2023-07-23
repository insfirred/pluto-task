// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: json['track_id'] as int,
      name: json['track_name'] as String,
      rating: json['track_rating'] as int,
      artist: json['artist_name'] as String,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'track_id': instance.id,
      'track_name': instance.name,
      'track_rating': instance.rating,
      'artist_name': instance.artist,
    };
