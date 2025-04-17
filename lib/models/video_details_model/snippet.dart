import 'localized.dart';
import 'thumbnails.dart';

class Snippet {
  String? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  List<String>? tags;
  String? categoryId;
  String? liveBroadcastContent;
  String? defaultLanguage;
  Localized? localized;
  String? defaultAudioLanguage;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.tags,
    this.categoryId,
    this.liveBroadcastContent,
    this.defaultLanguage,
    this.localized,
    this.defaultAudioLanguage,
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
        tags: (json['tags'] as List<dynamic>).map((e) => e.toString()).toList(),
        categoryId: json['categoryId'] as String?,
        liveBroadcastContent: json['liveBroadcastContent'] as String?,
        defaultLanguage: json['defaultLanguage'] as String?,
        localized: json['localized'] == null
            ? null
            : Localized.fromJson(json['localized'] as Map<String, dynamic>),
        defaultAudioLanguage: json['defaultAudioLanguage'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'publishedAt': publishedAt,
        'channelId': channelId,
        'title': title,
        'description': description,
        'thumbnails': thumbnails?.toJson(),
        'channelTitle': channelTitle,
        'tags': tags,
        'categoryId': categoryId,
        'liveBroadcastContent': liveBroadcastContent,
        'defaultLanguage': defaultLanguage,
        'localized': localized?.toJson(),
        'defaultAudioLanguage': defaultAudioLanguage,
      };
}
