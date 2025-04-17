import 'comment_snippet.dart';

class TopLevelComment {
  String? kind;
  String? etag;
  String? id;
  CommentSnippet? snippet;

  TopLevelComment({this.kind, this.etag, this.id, this.snippet});

  factory TopLevelComment.fromJson(Map<String, dynamic> json) {
    return TopLevelComment(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      id: json['id'] as String?,
      snippet: json['snippet'] == null
          ? null
          : CommentSnippet.fromJson(json['snippet'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'id': id,
        'snippet': snippet?.toJson(),
      };
}
