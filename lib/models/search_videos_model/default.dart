class Default {
  String? url;

  Default({this.url});

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}
