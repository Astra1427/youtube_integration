import 'snippet.dart';

class Comment {
  String? kind;
  String? etag;
  String? id;
  Snippet? snippet;

  Comment({this.kind, this.etag, this.id, this.snippet});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
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
