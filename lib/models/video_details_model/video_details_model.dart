import 'item.dart';
import 'page_info.dart';

class VideoDetailsModel {
  String? kind;
  String? etag;
  List<Item>? items;
  PageInfo? pageInfo;

  VideoDetailsModel({this.kind, this.etag, this.items, this.pageInfo});

  factory VideoDetailsModel.fromJson(Map<String, dynamic> json) {
    return VideoDetailsModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'items': items?.map((e) => e.toJson()).toList(),
        'pageInfo': pageInfo?.toJson(),
      };
}
