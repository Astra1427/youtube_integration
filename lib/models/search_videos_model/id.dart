class Id {
  String? kind;
  String? channelId;

  Id({this.kind, this.channelId});

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: json['kind'] as String?,
        channelId: json['channelId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'channelId': channelId,
      };
}
