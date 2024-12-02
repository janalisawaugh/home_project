import 'package:json_annotation/json_annotation.dart';
part 'menu_item_dto.g.dart';

@JsonSerializable()
class MenuItemDto {
  MenuItemDto(
      {required this.icon,
      required this.link,
      required this.label,
      required this.displayOrder,
      required this.enabled,
      required this.parent});

  factory MenuItemDto.fromJson(Map<String, dynamic> json) =>
      _$MenuItemDtoFromJson(json);

  final String icon;
  final String link;
  final String label;
  final int displayOrder;
  final bool enabled;
  final String parent;

  Map<String, dynamic> toJson() => _$MenuItemDtoToJson(this);
}
