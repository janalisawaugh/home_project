import '../../data/menu_item_dto.dart';

class MenuItemEntity {
  MenuItemEntity(
      {required this.icon,
      required this.link,
      required this.label,
      required this.displayOrder,
      required this.enabled,
      required this.parent});

  factory MenuItemEntity.fromDto(MenuItemDto dto) => MenuItemEntity(
      icon: dto.icon,
      link: dto.link,
      label: dto.label,
      displayOrder: dto.displayOrder,
      enabled: dto.enabled,
      parent: dto.parent);

  final String icon;
  final String link;
  final String label;
  final int displayOrder;
  final bool enabled;
  final String parent;
}
