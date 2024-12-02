import 'package:flutter/material.dart';
import 'package:home_project/presentation/widgets/menu_item.dart';
import '../../domain/entities/menu_item_entity.dart';

class Menu extends StatelessWidget {
  final List<MenuItemEntity> menuItems;

  const Menu({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(0),
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return MenuItem(menuItem: menuItems[index]);
        },
      ),
    );
  }
}
