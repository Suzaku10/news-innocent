import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  final String? id;
  final DateTime? createdAt;
  final String? contributorName;
  final String? contributorAvatar;
  final String? title;
  final String? content;
  final String? contentThumbnail;
  final List<String>? slideshow;

  NewsResponse(
      {this.id,
      this.createdAt,
      this.contributorName,
      this.contributorAvatar,
      this.title,
      this.content,
      this.contentThumbnail,
      this.slideshow});

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
