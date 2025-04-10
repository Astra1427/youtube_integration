class Statistics {
  String? viewCount;
  String? likeCount;
  String? favoriteCount;
  String? commentCount;

  Statistics({
    this.viewCount,
    this.likeCount,
    this.favoriteCount,
    this.commentCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json['viewCount'] as String?,
        likeCount: json['likeCount'] as String?,
        favoriteCount: json['favoriteCount'] as String?,
        commentCount: json['commentCount'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'viewCount': viewCount,
        'likeCount': likeCount,
        'favoriteCount': favoriteCount,
        'commentCount': commentCount,
      };
}
