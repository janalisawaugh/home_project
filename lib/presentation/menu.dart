import 'package:flutter/material.dart';
import 'package:home_project/data/menu_item_repository.dart';
import 'package:home_project/domain/menu_item_model.dart';
import 'package:home_project/presentation/menu_item.dart';

class Menu extends StatelessWidget {
  final MenuRepository menuRepository;

  Menu({required this.menuRepository});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      margin: const EdgeInsets.only(bottom: 16),
      child: FutureBuilder<List<MenuItemModel>>(
          future: menuRepository.getMenuItems(),
          builder: (contex, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return (Center(child: Text('Error loading')));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No menu items'));
            } else {
              final menuItems = snapshot.data!;
              return GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return MenuItem(menuItem: menuItems[index]);
                },
              );
            }
          }),
    );
  }
}
