class High {
  String? url;

  High({this.url});

  factory High.fromJson(Map<String, dynamic> json) => High(
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}
