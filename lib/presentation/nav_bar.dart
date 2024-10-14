import 'package:flutter/material.dart';
import 'package:home_project/presentation/nav_bar_item.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const NavBar(
      {super.key, required this.currentIndex, required this.onItemSelected});

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  List<NavBarItem> navBarItems = [];
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        selectedIndex: widget.currentIndex,
        onDestinationSelected: widget.onItemSelected,
        indicatorColor: Colors.transparent,
        destinations: navBarItems.map((item) {
          return NavBarItem(
              unselectedIcon: item.unselectedIcon,
              selectedIcon: item.selectedIcon,
              label: item.label);
        }).toList());
  }
}
