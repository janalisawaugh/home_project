import 'package:flutter/material.dart';
import 'package:home_project/data/menu_item_repository.dart';
import 'package:home_project/data/promo_banner_repository.dart';
import 'package:home_project/presentation/help_appbar.dart';
import 'package:home_project/presentation/menu.dart';
import 'package:home_project/presentation/nav_bar.dart';
import 'package:home_project/presentation/promo_banner.dart';

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
    final menuRepository = MenuRepository();
    final promoRepository = PromoBannerRepository();
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: HelpAppbar(),
      bottomNavigationBar: NavBar(
        currentIndex: currentIndex,
        onItemSelected: _onItemSelected,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hello',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  PromoBanner(
                      type: 'internal', promoRepository: promoRepository),
                  SizedBox(height: 10),
                  Menu(menuRepository: menuRepository),
                  SizedBox(height: 10),
                  PromoBanner(
                      type: 'external', promoRepository: promoRepository),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
