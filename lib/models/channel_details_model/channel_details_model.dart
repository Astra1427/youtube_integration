import 'detail.dart';
import 'page_info.dart';

class ChannelDetailsModel {
  String? kind;
  String? etag;
  PageInfo? pageInfo;
  List<Detail>? items;

  ChannelDetailsModel({this.kind, this.etag, this.pageInfo, this.items});

  factory ChannelDetailsModel.fromJson(Map<String, dynamic> json) {
    return ChannelDetailsModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'pageInfo': pageInfo?.toJson(),
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
