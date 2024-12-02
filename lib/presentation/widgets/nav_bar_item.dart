import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatelessWidget {
  final String unselectedIcon;
  final String selectedIcon;
  final String label;

  NavBarItem(
      {required this.unselectedIcon,
      required this.selectedIcon,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
        icon: SvgPicture.asset(
          unselectedIcon,
          height: 24,
          width: 24,
        ),
        selectedIcon: SvgPicture.asset(
          selectedIcon,
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
        ),
        label: label);
  }
}
