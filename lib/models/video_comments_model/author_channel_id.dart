class AuthorChannelId {
  String? value;

  AuthorChannelId({this.value});

  factory AuthorChannelId.fromJson(Map<String, dynamic> json) {
    return AuthorChannelId(
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'value': value,
      };
}
