class Medium {
  String? url;

  Medium({this.url});

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}
