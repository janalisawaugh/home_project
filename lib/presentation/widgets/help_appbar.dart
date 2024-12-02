import 'package:flutter/material.dart';
import 'package:home_project/ui_features/images.dart';

class HelpAppbar extends StatefulWidget implements PreferredSizeWidget {
  HelpAppbar({super.key});

  @override
  State<HelpAppbar> createState() => _HelpAppbar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HelpAppbar extends State<HelpAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Home',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
                color: Colors.black),
          ),
          const Spacer(),
          IconButton(
            icon: Image.asset(Images.support, width: 18, height: 18),
            onPressed: null,
          ),
          IconButton(
            icon: Image.asset(Images.mail, width: 18, height: 18),
            onPressed: null,
          )
        ],
      ),
      elevation: 0,
    );
  }
}
