import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/domain/entities/menu_item_entity.dart';
import 'package:home_project/presentation/widgets/menu.dart';
import 'package:home_project/presentation/widgets/menu_item.dart';

void main() {
  group('Menu Widget', () {
    testWidgets('displays the correct number of menu items',
        (WidgetTester tester) async {
      final menuItems = [
        MenuItemEntity(
          icon: 'assets/images/diet.png',
          link: '/page1',
          label: 'Page 1',
          displayOrder: 1,
          enabled: true,
          parent: '/',
        ),
        MenuItemEntity(
          icon: 'assets/images/fries.png',
          link: '/page1',
          label: 'Page 3',
          displayOrder: 2,
          enabled: true,
          parent: '/',
        ),
        MenuItemEntity(
          icon: 'assets/images/hamburger.png',
          link: '/page1',
          label: 'Page 3',
          displayOrder: 3,
          enabled: true,
          parent: '/',
        ),
        MenuItemEntity(
          icon: 'assets/images/ramen.png',
          link: '/page1',
          label: 'Page 4',
          displayOrder: 4,
          enabled: true,
          parent: '/',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Menu(menuItems: menuItems),
          ),
        ),
      );

      expect(find.byType(MenuItem), findsNWidgets(4));
    });

    testWidgets('displays the correct menu item details',
        (WidgetTester tester) async {
      final menuItems = [
        MenuItemEntity(
          icon: 'assets/images/diet.png',
          link: '/page1',
          label: 'Page 1',
          displayOrder: 1,
          enabled: true,
          parent: '/',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Menu(menuItems: menuItems),
          ),
        ),
      );

      expect(find.text('Page 1'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      final Image image = tester.widget(find.byType(Image));
      expect((image.image as AssetImage).assetName, 'assets/images/diet.png');
    });

    testWidgets('displays the correct number of columns in the grid',
        (WidgetTester tester) async {
      final menuItems = [
        MenuItemEntity(
          icon: 'assets/images/diet.png',
          link: '/page1',
          label: 'Page 1',
          displayOrder: 1,
          enabled: true,
          parent: '/',
        ),
        MenuItemEntity(
          icon: 'assets/images/fries.png',
          link: '/page1',
          label: 'Page 3',
          displayOrder: 2,
          enabled: true,
          parent: '/',
        ),
        MenuItemEntity(
          icon: 'assets/images/hamburger.png',
          link: '/page1',
          label: 'Page 3',
          displayOrder: 3,
          enabled: true,
          parent: '/',
        ),
        MenuItemEntity(
          icon: 'assets/images/ramen.png',
          link: '/page1',
          label: 'Page 4',
          displayOrder: 4,
          enabled: true,
          parent: '/',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Menu(menuItems: menuItems),
          ),
        ),
      );

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final gridDelegate =
          gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(gridDelegate.crossAxisCount, 4);
    });
  });
}
