import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final ImageIcon unselectedIcon;
  final ImageIcon selectedIcon;
  final String label;

  NavBarItem(
      {required this.unselectedIcon,
      required this.selectedIcon,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
        icon: unselectedIcon, selectedIcon: selectedIcon, label: label);
  }
}
