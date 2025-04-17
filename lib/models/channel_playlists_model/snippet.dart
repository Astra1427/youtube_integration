import 'localized.dart';
import 'thumbnails.dart';

class Snippet {
  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  Localized? localized;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.localized,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.parse(json['publishedAt'] as String),
        channelId: json['channelId'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        thumbnails: json['thumbnails'] == null
            ? null
            : Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
        channelTitle: json['channelTitle'] as String?,
        localized: json['localized'] == null
            ? null
            : Localized.fromJson(json['localized'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'publishedAt': publishedAt?.toIso8601String(),
        'channelId': channelId,
        'title': title,
        'description': description,
        'thumbnails': thumbnails?.toJson(),
        'channelTitle': channelTitle,
        'localized': localized?.toJson(),
      };
}
