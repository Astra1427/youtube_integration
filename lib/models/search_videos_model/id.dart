class Id {
  String? kind;
  String? channelId;
  String? videoId;

  Id({this.kind, this.channelId, this.videoId});

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: json['kind'] as String?,
        channelId: json['channelId'] as String?,
        videoId: json['videoId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'channelId': channelId,
        'videoId': videoId,
      };
}
