class MenuItemModel {
  final String icon;
  final String link;
  final String label;
  final int displayOrder;
  final bool enabled;
  final int parent;

  MenuItemModel(
      {required this.icon,
      required this.link,
      required this.label,
      required this.displayOrder,
      required this.enabled,
      required this.parent});
}
