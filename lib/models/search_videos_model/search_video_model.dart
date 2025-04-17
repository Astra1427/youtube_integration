import 'page_info.dart';
import 'video.dart';

class SearchVideosModel {
  String? kind;
  String? etag;
  String? nextPageToken;
  String? regionCode;
  PageInfo? pageInfo;
  List<Video>? videos;

  SearchVideosModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    this.videos,
  });

  factory SearchVideosModel.fromJson(Map<String, dynamic> json) {
    return SearchVideosModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      nextPageToken: json['nextPageToken'] as String?,
      regionCode: json['regionCode'] as String?,
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      videos: (json['items'] as List<dynamic>?)
          ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'nextPageToken': nextPageToken,
        'regionCode': regionCode,
        'pageInfo': pageInfo?.toJson(),
        'items': videos?.map((e) => e.toJson()).toList(),
      };
}
