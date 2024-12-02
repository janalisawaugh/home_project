import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_project/data/promo_banner_repository.dart';
import 'package:home_project/domain/usecases/get_menu_items.dart';
import 'package:home_project/presentation/cubit/menu_cubit.dart';
import 'package:home_project/presentation/widgets/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repository/menu_items_remote_repository.dart';
import 'firebase_options.dart';
import 'presentation/widgets/help_appbar.dart';
import 'presentation/widgets/nav_bar.dart';
import 'presentation/widgets/promo_banner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: BlocProvider(
          create: (_) => MenuCubit(GetMenuItemsUsecaseImpl(
              MenuItemsRemoteRepository(FirebaseFirestore.instance))),
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
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
  void initState() {
    super.initState();
    context.read<MenuCubit>().getMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    // final menuRepository = MenuRepository();
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
                  BlocBuilder<MenuCubit, MenuState>(builder: (context, state) {
                    return state.when(
                      loading: () => GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 0.0,
                        ),
                        itemCount: 6,
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
                                    borderRadius: BorderRadius.circular(8),
                                  ),
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
                      ),
                      error: (message) => Center(
                        child: Text(message),
                      ),
                      loaded: (menuItems) => Menu(menuItems: menuItems),
                    );
                  }),
                  // Menu(menuRepository: menuRepository),
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
