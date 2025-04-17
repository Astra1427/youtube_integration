import 'author_channel_id.dart';

class CommentSnippet {
  String? channelId;
  String? videoId;
  String? textDisplay;
  String? textOriginal;
  String? authorDisplayName;
  String? authorProfileImageUrl;
  String? authorChannelUrl;
  AuthorChannelId? authorChannelId;
  bool? canRate;
  String? viewerRating;
  int? likeCount;
  String? publishedAt;
  String? updatedAt;

  CommentSnippet({
    this.channelId,
    this.videoId,
    this.textDisplay,
    this.textOriginal,
    this.authorDisplayName,
    this.authorProfileImageUrl,
    this.authorChannelUrl,
    this.authorChannelId,
    this.canRate,
    this.viewerRating,
    this.likeCount,
    this.publishedAt,
    this.updatedAt,
  });

  factory CommentSnippet.fromJson(Map<String, dynamic> json) {
    return CommentSnippet(
      channelId: json['channelId'] as String?,
      videoId: json['videoId'] as String?,
      textDisplay: json['textDisplay'] as String?,
      textOriginal: json['textOriginal'] as String?,
      authorDisplayName: json['authorDisplayName'] as String?,
      authorProfileImageUrl: json['authorProfileImageUrl'] as String?,
      authorChannelUrl: json['authorChannelUrl'] as String?,
      authorChannelId: json['authorChannelId'] == null
          ? null
          : AuthorChannelId.fromJson(
              json['authorChannelId'] as Map<String, dynamic>),
      canRate: json['canRate'] as bool?,
      viewerRating: json['viewerRating'] as String?,
      likeCount: json['likeCount'] as int?,
      publishedAt: json['publishedAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'channelId': channelId,
        'videoId': videoId,
        'textDisplay': textDisplay,
        'textOriginal': textOriginal,
        'authorDisplayName': authorDisplayName,
        'authorProfileImageUrl': authorProfileImageUrl,
        'authorChannelUrl': authorChannelUrl,
        'authorChannelId': authorChannelId?.toJson(),
        'canRate': canRate,
        'viewerRating': viewerRating,
        'likeCount': likeCount,
        'publishedAt': publishedAt,
        'updatedAt': updatedAt,
      };
}
