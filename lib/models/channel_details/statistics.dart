class Statistics {
  String? viewCount;
  String? subscriberCount;
  bool? hiddenSubscriberCount;
  String? videoCount;

  Statistics({
    this.viewCount,
    this.subscriberCount,
    this.hiddenSubscriberCount,
    this.videoCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json['viewCount'] as String?,
        subscriberCount: json['subscriberCount'] as String?,
        hiddenSubscriberCount: json['hiddenSubscriberCount'] as bool?,
        videoCount: json['videoCount'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'viewCount': viewCount,
        'subscriberCount': subscriberCount,
        'hiddenSubscriberCount': hiddenSubscriberCount,
        'videoCount': videoCount,
      };
}
