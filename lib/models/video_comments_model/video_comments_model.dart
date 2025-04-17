import 'item.dart';
import 'page_info.dart';

class VideoCommentsModel {
  String? kind;
  String? etag;
  PageInfo? pageInfo;
  List<Comment>? comments;

  VideoCommentsModel({this.kind, this.etag, this.pageInfo, this.comments});

  factory VideoCommentsModel.fromJson(Map<String, dynamic> json) {
    return VideoCommentsModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      comments: (json['items'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'pageInfo': pageInfo?.toJson(),
        'items': comments?.map((e) => e.toJson()).toList(),
      };
}
