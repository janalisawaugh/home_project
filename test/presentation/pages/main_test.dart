import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/domain/usecases/get_menu_items_usecase.dart';
import 'package:home_project/domain/usecases/get_promos_usecase.dart';
import 'package:home_project/main.dart';
import 'package:home_project/presentation/widgets/help_appbar.dart';
import 'package:home_project/presentation/widgets/nav_bar.dart';
import 'package:home_project/presentation/widgets/promo_banner.dart';
import 'package:home_project/presentation/widgets/menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_project/presentation/cubit/menu_cubit.dart';
import 'package:home_project/presentation/cubit/promo_cubit.dart';
import 'package:home_project/domain/entities/menu_item_entity.dart';
import 'package:home_project/domain/entities/promo_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'main_test.mocks.dart';

@GenerateMocks([GetMenuItemsUsecase, GetPromosUsecase])
void main() {
  group('MyHomePage', () {
    late MockGetMenuItemsUsecase mockGetMenuItemsUsecase;
    late MockGetPromosUsecase mockGetPromosUsecase;

    setUp(() {
      mockGetMenuItemsUsecase = MockGetMenuItemsUsecase();
      mockGetPromosUsecase = MockGetPromosUsecase();
    });
    testWidgets('displays the correct widgets', (WidgetTester tester) async {
      when(mockGetMenuItemsUsecase.getMenuItems()).thenAnswer(
        (_) async* {
          yield [
            MenuItemEntity(
              icon: 'assets/images/diet.png',
              link: '/page1',
              label: 'Page 1',
              displayOrder: 1,
              enabled: true,
              parent: '/',
            ),
          ];
        },
      );

      when(mockGetPromosUsecase.getPromos()).thenAnswer(
        (_) async* {
          yield [
            PromoEntity(
              title: 'Promo 1',
              description: 'Description 1',
              buttonLabel: 'Learn More',
              imageUrl: 'assets/images/diet.png',
              link: '/promo1',
              type: 'internal',
              category: 'Food',
            ),
          ];
        },
      );
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<MenuCubit>(
              create: (_) => MenuCubit(mockGetMenuItemsUsecase),
            ),
            BlocProvider<PromoCubit>(
              create: (_) => PromoCubit(mockGetPromosUsecase),
            ),
          ],
          child: const MaterialApp(
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(HelpAppbar), findsOneWidget);

      expect(find.byType(NavBar), findsOneWidget);

      expect(find.byType(PromoBanner), findsWidgets);

      expect(find.byType(Menu), findsWidgets);
    });
  });
}
