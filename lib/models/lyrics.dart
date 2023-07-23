import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyrics.g.dart';

@JsonSerializable()
class Lyrics {
  @JsonKey(name: 'lyrics_body')
  final String lyrics;
  @JsonKey(name: 'lyrics_copyright')
  final String copyright;

  const Lyrics({
    required this.lyrics,
    required this.copyright,
  });

  factory Lyrics.fromJson(Map<String, dynamic> json) => _$LyricsFromJson(json);
}
