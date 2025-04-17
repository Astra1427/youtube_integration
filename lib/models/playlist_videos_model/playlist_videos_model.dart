import 'playlist_videos.dart';
import 'page_info.dart';

class PlaylistVideosModel {
  String? kind;
  String? etag;
  String? nextPageToken;
  List<PlayListVideos>? videos;
  PageInfo? pageInfo;

  PlaylistVideosModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.videos,
    this.pageInfo,
  });

  factory PlaylistVideosModel.fromJson(Map<String, dynamic> json) {
    return PlaylistVideosModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      nextPageToken: json['nextPageToken'] as String?,
      videos: (json['items'] as List<dynamic>?)
          ?.map((e) => PlayListVideos.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'nextPageToken': nextPageToken,
        'items': videos?.map((e) => e.toJson()).toList(),
        'pageInfo': pageInfo?.toJson(),
      };
}
