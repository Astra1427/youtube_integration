class High {
  final String? url;
  final int? width;
  final int? height;

  const High({this.url, this.width, this.height});

  factory High.fromJson(Map<String, dynamic> json) => High(
        url: json['url'] as String?,
        width: json['width'] as int?,
        height: json['height'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'width': width,
        'height': height,
      };
}
