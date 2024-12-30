import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_project/domain/usecases/get_menu_items_usecase.dart';
import 'package:home_project/presentation/cubit/menu_cubit.dart';
import 'package:home_project/presentation/widgets/menu.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'data/repository/menu_items_remote_repository.dart';
// import 'firebase_options.dart';
import 'data/repository/promos_remote_repository.dart';
import 'domain/usecases/get_promos_usecase.dart';
import 'presentation/cubit/promo_cubit.dart';
import 'presentation/widgets/help_appbar.dart';
import 'presentation/widgets/nav_bar.dart';
import 'presentation/widgets/promo_banner.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => MenuCubit(
                  GetMenuItemsUsecaseImpl(MenuItemsRemoteRepository()))),
          BlocProvider(
              create: (_) =>
                  PromoCubit(GetPromosUsecaseImpl(PromosRemoteRepository()))),
        ],
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
    context.read<PromoCubit>().getPromos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: HelpAppbar(),
      bottomNavigationBar: NavBar(
        currentIndex: currentIndex,
        onItemSelected: _onItemSelected,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<PromoCubit, PromoState>(builder: (context, state) {
              return state.when(
                loading: () => Container(
                  height: 144,
                  width: 328,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                ),
                loaded: (promos) =>
                    PromoBanner(type: 'internal', promos: promos),
                error: (message) => const Center(
                  child: Text('Error loading'),
                ),
              );
            }),
            const SizedBox(height: 10),
            BlocBuilder<MenuCubit, MenuState>(builder: (context, state) {
              return state.when(
                loading: () => GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          const SizedBox(height: 5),
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
            const SizedBox(height: 10),
            BlocBuilder<PromoCubit, PromoState>(builder: (context, state) {
              return state.when(
                  loading: () => Container(
                        height: 144,
                        width: 328,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                      ),
                  loaded: (promos) =>
                      PromoBanner(type: 'external', promos: promos),
                  error: (message) => const Center(
                        child: Text('Error loading'),
                      ));
            }),
          ]),
        ),
      ),
    );
  }
}
