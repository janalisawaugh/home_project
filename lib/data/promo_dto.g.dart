// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromoDto _$PromoDtoFromJson(Map<String, dynamic> json) => PromoDto(
      title: json['title'] as String,
      description: json['description'] as String,
      buttonLabel: json['buttonLabel'] as String,
      imageUrl: json['imageUrl'] as String,
      link: json['link'] as String,
      type: json['type'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$PromoDtoToJson(PromoDto instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'buttonLabel': instance.buttonLabel,
      'imageUrl': instance.imageUrl,
      'link': instance.link,
      'type': instance.type,
      'category': instance.category,
    };
