// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) => NewsResponse(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      contributorName: json['contributorName'] as String?,
      contributorAvatar: json['contributorAvatar'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      contentThumbnail: json['contentThumbnail'] as String?,
      slideshow: (json['slideshow'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'contributorName': instance.contributorName,
      'contributorAvatar': instance.contributorAvatar,
      'title': instance.title,
      'content': instance.content,
      'contentThumbnail': instance.contentThumbnail,
      'slideshow': instance.slideshow,
    };
