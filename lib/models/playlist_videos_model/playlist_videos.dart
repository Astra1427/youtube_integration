import 'snippet.dart';

class PlayListVideos {
  String? kind;
  String? etag;
  String? id;
  Snippet? snippet;

  PlayListVideos({this.kind, this.etag, this.id, this.snippet});

  factory PlayListVideos.fromJson(Map<String, dynamic> json) => PlayListVideos(
        kind: json['kind'] as String?,
        etag: json['etag'] as String?,
        id: json['id'] as String?,
        snippet: json['snippet'] == null
            ? null
            : Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'id': id,
        'snippet': snippet?.toJson(),
      };
}
