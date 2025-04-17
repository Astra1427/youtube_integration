import 'snippet.dart';
import 'statistics.dart';

class Detail {
  String? kind;
  String? etag;
  String? id;
  Snippet? snippet;
  Statistics? statistics;

  Detail({this.kind, this.etag, this.id, this.snippet, this.statistics});

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        kind: json['kind'] as String?,
        etag: json['etag'] as String?,
        id: json['id'] as String?,
        snippet: json['snippet'] == null
            ? null
            : Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
        statistics: json['statistics'] == null
            ? null
            : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'id': id,
        'snippet': snippet?.toJson(),
        'statistics': statistics?.toJson(),
      };
}
