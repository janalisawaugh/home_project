import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/domain/entities/promo_entity.dart';
import 'package:home_project/presentation/widgets/promo.dart';

void main() {
  group('Promo', () {
    testWidgets('renders promo with correct elements',
        (WidgetTester tester) async {
      final promoEntity = PromoEntity(
        title: 'Power your life',
        description:
            'Find out about how to click buttons to empower your life.',
        buttonLabel: 'Click here',
        imageUrl: 'assets/images/diet.png',
        link: '/page2',
        type: 'internal',
        category: 'Food',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Promo(promoEntity: promoEntity),
          ),
        ),
      );

      expect(find.text('Power your life'), findsOneWidget);
      expect(
          find.text(
              'Find out about how to click buttons to empower your life.'),
          findsOneWidget);
      expect(find.text('Click here'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      final Image image = tester.widget(find.byType(Image));
      expect((image.image as AssetImage).assetName, 'assets/images/diet.png');

      final container = tester.widget<Container>(find.byType(Container).first);
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.blue);
    });

    testWidgets('navigates to the correct link when button is pressed',
        (WidgetTester tester) async {
      final promoEntity = PromoEntity(
        title: 'Power your life',
        description:
            'Find out about how to click buttons to empower your life.',
        buttonLabel: 'Click here',
        imageUrl: 'assets/images/diet.png',
        link: '/page2',
        type: 'internal',
        category: 'Food',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Promo(promoEntity: promoEntity),
          ),
          routes: {
            '/page2': (context) => Scaffold(body: Text('Promo Page')),
          },
        ),
      );

      await tester.tap(find.text('Click here'));
      await tester.pumpAndSettle();

      expect(find.text('Promo Page'), findsOneWidget);
    });
  });
}
