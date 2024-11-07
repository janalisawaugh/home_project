import 'package:flutter/material.dart';
import 'package:home_project/data/menu_item_repository.dart';
import 'package:home_project/presentation/help_appbar.dart';
import 'package:home_project/presentation/menu.dart';
import 'package:home_project/presentation/menu_item.dart';
import 'package:home_project/presentation/nav_bar.dart';
import 'package:home_project/ui_features/images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  void _onItemSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<MenuItem> menuItems = [
    //   MenuItem(
    //     icon: Images.diet,
    //     link: '/page1',
    //     label: 'Page 1',
    //     displayOrder: 1,
    //     enabled: true,
    //     parent: 0,
    //   ),
    //   MenuItem(
    //     icon: Images.fries,
    //     link: '/page2',
    //     label: 'Page 2',
    //     displayOrder: 2,
    //     enabled: true,
    //     parent: 0,
    //   ),
    //   MenuItem(
    //     icon: Images.hamburger,
    //     link: '/page2',
    //     label: 'Page 3',
    //     displayOrder: 3,
    //     enabled: true,
    //     parent: 0,
    //   ),
    //   MenuItem(
    //     icon: Images.ramen,
    //     link: '/page2',
    //     label: 'Page 4',
    //     displayOrder: 4,
    //     enabled: true,
    //     parent: 0,
    //   ),
    //   MenuItem(
    //     icon: Images.strawberry,
    //     link: '/page2',
    //     label: 'Page 5',
    //     displayOrder: 5,
    //     enabled: true,
    //     parent: 0,
    //   ),
    //   MenuItem(
    //     icon: Images.taco,
    //     link: '/page2',
    //     label: 'Page 6',
    //     displayOrder: 6,
    //     enabled: true,
    //     parent: 0,
    //   )
    // ];
    final menuRepository = MenuRepository();
    return Scaffold(
      appBar: HelpAppbar(),
      bottomNavigationBar: NavBar(
        currentIndex: currentIndex,
        onItemSelected: _onItemSelected,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Menu(menuRepository: menuRepository)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
