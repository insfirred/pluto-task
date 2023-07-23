// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackData _$TrackDataFromJson(Map<String, dynamic> json) => TrackData(
      id: json['track_id'] as int,
      name: json['track_name'] as String,
      isExplicit: json['explicit'] as int,
      rating: json['track_rating'] as int,
      artist: json['artist_name'] as String,
      numFavourite: json['num_favourite'] as int,
      album: json['album_name'] as String,
      trackShareUrl: json['track_share_url'] as String,
    );

Map<String, dynamic> _$TrackDataToJson(TrackData instance) => <String, dynamic>{
      'track_id': instance.id,
      'track_name': instance.name,
      'explicit': instance.isExplicit,
      'track_rating': instance.rating,
      'artist_name': instance.artist,
      'num_favourite': instance.numFavourite,
      'album_name': instance.album,
      'track_share_url': instance.trackShareUrl,
    };
