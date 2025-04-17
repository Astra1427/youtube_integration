class PageInfo {
  final int? totalResults;
  final int? resultsPerPage;

  const PageInfo({this.totalResults, this.resultsPerPage});

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json['totalResults'] as int?,
        resultsPerPage: json['resultsPerPage'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'totalResults': totalResults,
        'resultsPerPage': resultsPerPage,
      };
}
