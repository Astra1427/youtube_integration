import 'playlist.dart';
import 'page_info.dart';

class ChannelPlaylistsModel {
  String? kind;
  String? etag;
  String? nextPageToken;
  PageInfo? pageInfo;
  List<Playlist>? playlists;

  ChannelPlaylistsModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.pageInfo,
    this.playlists,
  });

  factory ChannelPlaylistsModel.fromJson(Map<String, dynamic> json) {
    return ChannelPlaylistsModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      nextPageToken: json['nextPageToken'] as String?,
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      playlists: (json['items'] as List<dynamic>?)
          ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'nextPageToken': nextPageToken,
        'pageInfo': pageInfo?.toJson(),
        'items': playlists?.map((e) => e.toJson()).toList(),
      };
}
