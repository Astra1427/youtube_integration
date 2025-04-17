class ResourceId {
  String? kind;
  String? videoId;

  ResourceId({this.kind, this.videoId});

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: json['kind'] as String?,
        videoId: json['videoId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'videoId': videoId,
      };
}
