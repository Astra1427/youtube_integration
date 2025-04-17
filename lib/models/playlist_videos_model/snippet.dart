import 'resource_id.dart';
import 'thumbnails.dart';

class Snippet {
  String? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  String? playlistId;
  int? position;
  ResourceId? resourceId;
  String? videoOwnerChannelTitle;
  String? videoOwnerChannelId;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.position,
    this.resourceId,
    this.videoOwnerChannelTitle,
    this.videoOwnerChannelId,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json['publishedAt'] as String?,
        channelId: json['channelId'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        thumbnails: json['thumbnails'] == null
            ? null
            : Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
        channelTitle: json['channelTitle'] as String?,
        playlistId: json['playlistId'] as String?,
        position: json['position'] as int?,
        resourceId: json['resourceId'] == null
            ? null
            : ResourceId.fromJson(json['resourceId'] as Map<String, dynamic>),
        videoOwnerChannelTitle: json['videoOwnerChannelTitle'] as String?,
        videoOwnerChannelId: json['videoOwnerChannelId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'publishedAt': publishedAt,
        'channelId': channelId,
        'title': title,
        'description': description,
        'thumbnails': thumbnails?.toJson(),
        'channelTitle': channelTitle,
        'playlistId': playlistId,
        'position': position,
        'resourceId': resourceId?.toJson(),
        'videoOwnerChannelTitle': videoOwnerChannelTitle,
        'videoOwnerChannelId': videoOwnerChannelId,
      };
}
