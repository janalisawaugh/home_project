import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/presentation/widgets/help_appbar.dart';
import 'package:home_project/ui_features/images.dart';

void main() {
  group('HelpAppbar', () {
    testWidgets('renders help appbar with correct title and icons',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(MaterialApp(home: Scaffold(appBar: HelpAppbar())));

      expect(find.text('Home'), findsOneWidget);
      final appBar = tester.firstWidget(find.byType(AppBar)) as AppBar;
      expect(appBar.backgroundColor, Colors.white);
      expect(appBar.elevation, 0.0);

      final supportIcon = tester.firstWidget(find.descendant(
          of: find.byType(IconButton).first,
          matching: find.byType(Image))) as Image;
      expect(supportIcon.image, AssetImage(Images.support));

      final mailIcon = tester.firstWidget(find.descendant(
          of: find.byType(IconButton).at(1),
          matching: find.byType(Image))) as Image;
      expect(mailIcon.image, AssetImage(Images.mail));
    });

    testWidgets('renders two IconButton widgets', (WidgetTester tester) async {
      await tester
          .pumpWidget(MaterialApp(home: Scaffold(appBar: HelpAppbar())));

      expect(find.byType(IconButton), findsNWidgets(2));
    });

    testWidgets('renders correct images in IconButton widgets',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(MaterialApp(home: Scaffold(appBar: HelpAppbar())));

      expect(
          find.byWidgetPredicate((widget) =>
              widget is Image &&
              widget.image is AssetImage &&
              (widget.image as AssetImage).assetName == Images.support),
          findsOneWidget);

      expect(
          find.byWidgetPredicate((widget) =>
              widget is Image &&
              widget.image is AssetImage &&
              (widget.image as AssetImage).assetName == Images.mail),
          findsOneWidget);
    });
  });
}
