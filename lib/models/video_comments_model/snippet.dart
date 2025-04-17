import 'top_level_comment.dart';

class Snippet {
  String? channelId;
  String? videoId;
  TopLevelComment? topLevelComment;
  bool? canReply;
  int? totalReplyCount;
  bool? isPublic;

  Snippet({
    this.channelId,
    this.videoId,
    this.topLevelComment,
    this.canReply,
    this.totalReplyCount,
    this.isPublic,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        channelId: json['channelId'] as String?,
        videoId: json['videoId'] as String?,
        topLevelComment: json['topLevelComment'] == null
            ? null
            : TopLevelComment.fromJson(
                json['topLevelComment'] as Map<String, dynamic>),
        canReply: json['canReply'] as bool?,
        totalReplyCount: json['totalReplyCount'] as int?,
        isPublic: json['isPublic'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'channelId': channelId,
        'videoId': videoId,
        'topLevelComment': topLevelComment?.toJson(),
        'canReply': canReply,
        'totalReplyCount': totalReplyCount,
        'isPublic': isPublic,
      };
}
