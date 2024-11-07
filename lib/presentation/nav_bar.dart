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
        unselectedIcon: const ImageIcon(AssetImage(Images.home)),
        selectedIcon: const ImageIcon(
          AssetImage(Images.home),
          color: Colors.blue,
        ),
        label: 'Home'),
    NavBarItem(
        unselectedIcon: const ImageIcon(AssetImage(Images.clock)),
        selectedIcon: const ImageIcon(
          AssetImage(Images.clock),
          color: Colors.blue,
        ),
        label: 'Clock'),
    NavBarItem(
        unselectedIcon: const ImageIcon(AssetImage(Images.salary)),
        selectedIcon: const ImageIcon(
          AssetImage(Images.salary),
          color: Colors.blue,
        ),
        label: 'Money'),
    NavBarItem(
        unselectedIcon: const ImageIcon(AssetImage(Images.appIcon)),
        selectedIcon:
            const ImageIcon(AssetImage(Images.appIcon), color: Colors.blue),
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
