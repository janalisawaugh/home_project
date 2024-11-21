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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(0),
      child: FutureBuilder<List<MenuItemModel>>(
          future: menuRepository.getMenuItems(),
          builder: (contex, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              final menuItems = snapshot.data!;
              return GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return Center(
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
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 15,
                          width: 58,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(5),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return (Center(child: Text('Error loading')));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No menu items'));
            } else {
              final menuItems = snapshot.data!;
              return GridView.builder(
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
              );
            }
          }),
    );
  }
}
