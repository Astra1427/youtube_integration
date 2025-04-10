import 'snippet.dart';

class PlaylistVideoModel {
  String? kind;
  String? etag;
  String? id;
  VideoSnippet? snippet;

  PlaylistVideoModel({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  factory PlaylistVideoModel.fromJson(Map<String, dynamic> json) =>
      PlaylistVideoModel(
        kind: json['kind'] as String?,
        etag: json['etag'] as String?,
        id: json['id'] as String?,
        snippet: VideoSnippet.fromJson(json['snippet'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'id': id,
        'snippet': snippet?.toJson(),
      };
}
