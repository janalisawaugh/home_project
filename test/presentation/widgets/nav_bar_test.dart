import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/presentation/widgets/nav_bar.dart';
import 'package:home_project/presentation/widgets/nav_bar_item.dart';
import 'package:home_project/ui_features/images.dart';

void main() {
  group('NavBar', () {
    testWidgets('renders NavigationBar with correct items',
        (WidgetTester tester) async {
      int selectedIndex = 0;
      void onItemSelected(int index) {
        selectedIndex = index;
      }

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              bottomNavigationBar: NavBar(
                  currentIndex: selectedIndex,
                  onItemSelected: onItemSelected))));

      expect(find.byType(NavigationBar), findsOneWidget);
      expect(find.byType(NavBarItem), findsNWidgets(4));
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Clock'), findsOneWidget);
      expect(find.text('Money'), findsOneWidget);
      expect(find.text('App'), findsOneWidget);
    });

    testWidgets('calls onItemSelected when a destination is tapped',
        (WidgetTester tester) async {
      int selectedIndex = 0;
      void onItemSelected(int index) {
        selectedIndex = index;
      }

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              bottomNavigationBar: NavBar(
                  currentIndex: selectedIndex,
                  onItemSelected: onItemSelected))));
      await tester.tap(find.text('Clock'));
      await tester.pump();
      expect(selectedIndex, 1);
    });

    testWidgets('updates selectedIndex when a destination is tapped',
        (WidgetTester tester) async {
      int selectedIndex = 0;
      void onItemSelected(int index) {
        selectedIndex = index;
      }

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              bottomNavigationBar: NavBar(
                  currentIndex: selectedIndex,
                  onItemSelected: onItemSelected))));
      await tester.tap(find.text('Money'));
      await tester.pump();
      expect(selectedIndex, 2);
    });

    testWidgets('renders correct icons for each NavBarItem',
        (WidgetTester tester) async {
      int selectedIndex = 0;
      void onItemSelected(int index) {
        selectedIndex = index;
      }

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              bottomNavigationBar: NavBar(
                  currentIndex: selectedIndex,
                  onItemSelected: onItemSelected))));

      expect(
          find.byWidgetPredicate((widget) =>
              widget is SvgPicture &&
              (widget.bytesLoader as SvgAssetLoader).assetName == Images.home2),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is SvgPicture &&
              (widget.bytesLoader as SvgAssetLoader).assetName ==
                  Images.clock2),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is SvgPicture &&
              (widget.bytesLoader as SvgAssetLoader).assetName == Images.money),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is SvgPicture &&
              (widget.bytesLoader as SvgAssetLoader).assetName ==
                  Images.appIcon2),
          findsOneWidget);
    });
  });
}
