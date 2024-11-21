import 'package:flutter/material.dart';
import 'package:home_project/presentation/nav_bar_item.dart';
import 'package:home_project/ui_features/images.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const NavBar(
      {super.key, required this.currentIndex, required this.onItemSelected});

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  List<NavBarItem> navBarItems = [
    NavBarItem(
        unselectedIcon: Images.home2,
        selectedIcon: Images.home2,
        label: 'Home'),
    NavBarItem(
        unselectedIcon: Images.clock2,
        selectedIcon: Images.clock2,
        label: 'Clock'),
    NavBarItem(
        unselectedIcon: Images.money,
        selectedIcon: Images.money,
        label: 'Money'),
    NavBarItem(
        unselectedIcon: Images.appIcon2,
        selectedIcon: Images.appIcon2,
        label: 'App'),
  ];
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(color: Colors.blue, fontSize: 12);
          }
          return const TextStyle(color: Colors.grey, fontSize: 12);
        }),
      ),
      child: NavigationBar(
          selectedIndex: widget.currentIndex,
          onDestinationSelected: widget.onItemSelected,
          indicatorColor: Colors.transparent,
          destinations: navBarItems.map((item) {
            return NavBarItem(
                unselectedIcon: item.unselectedIcon,
                selectedIcon: item.selectedIcon,
                label: item.label);
          }).toList()),
    );
  }
}
