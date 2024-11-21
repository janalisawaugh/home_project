import 'package:flutter/material.dart';
import 'package:home_project/domain/menu_item_model.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel menuItem;
  const MenuItem({Key? key, required this.menuItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: menuItem.enabled ? () {} : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(5),
              child: Image.asset(menuItem.icon, width: 26, height: 26)),
          const SizedBox(height: 5, width: 50),
          Text(menuItem.label, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
