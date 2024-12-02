// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemDto _$MenuItemDtoFromJson(Map<String, dynamic> json) => MenuItemDto(
      icon: json['icon'] as String,
      link: json['link'] as String,
      label: json['label'] as String,
      displayOrder: (json['displayOrder'] as num).toInt(),
      enabled: json['enabled'] as bool,
      parent: json['parent'] as String,
    );

Map<String, dynamic> _$MenuItemDtoToJson(MenuItemDto instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'link': instance.link,
      'label': instance.label,
      'displayOrder': instance.displayOrder,
      'enabled': instance.enabled,
      'parent': instance.parent,
    };
