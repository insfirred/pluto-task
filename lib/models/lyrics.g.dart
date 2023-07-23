// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lyrics _$LyricsFromJson(Map<String, dynamic> json) => Lyrics(
      lyrics: json['lyrics_body'] as String,
      copyright: json['lyrics_copyright'] as String,
    );

Map<String, dynamic> _$LyricsToJson(Lyrics instance) => <String, dynamic>{
      'lyrics_body': instance.lyrics,
      'lyrics_copyright': instance.copyright,
    };
