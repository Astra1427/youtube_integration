import 'package:youtube_integration/models/video_details/localized.dart';
import 'thumbnails.dart';

class Snippet {
  String? title;
  String? description;
  String? customUrl;
  DateTime? publishedAt;
  Thumbnails? thumbnails;
  Localized? localized;
  String? country;

  Snippet({
    this.title,
    this.description,
    this.customUrl,
    this.publishedAt,
    this.thumbnails,
    this.localized,
    this.country,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        title: json['title'] as String?,
        description: json['description'] as String?,
        customUrl: json['customUrl'] as String?,
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.parse(json['publishedAt'] as String),
        thumbnails: json['thumbnails'] == null
            ? null
            : Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
        localized: json['localized'] == null
            ? null
            : Localized.fromJson(json['localized'] as Map<String, dynamic>),
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'customUrl': customUrl,
        'publishedAt': publishedAt?.toIso8601String(),
        'thumbnails': thumbnails?.toJson(),
        'localized': localized?.toJson(),
        'country': country,
      };
}
