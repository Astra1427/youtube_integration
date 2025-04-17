import 'channel_video.dart';
import 'page_info.dart';

class ChannelVideoModel {
  final String? kind;
  final String? etag;
  final String? nextPageToken;
  final String? regionCode;
  final PageInfo? pageInfo;
  final List<ChannelVideo>? videos;

  const ChannelVideoModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    this.videos,
  });

  factory ChannelVideoModel.fromJson(Map<String, dynamic> json) {
    return ChannelVideoModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      nextPageToken: json['nextPageToken'] as String?,
      regionCode: json['regionCode'] as String?,
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      videos: (json['items'] as List<dynamic>?)
          ?.map((e) => ChannelVideo.fromJson(e as Map<String, dynamic>))
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
