import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/domain/entities/promo_entity.dart';
import 'package:home_project/presentation/widgets/promo_banner.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  late List<PromoEntity> promos;
  group('PromoBanner', () {
    setUp(() {
      promos = [
        PromoEntity(
          title: 'Power your life',
          description:
              'Find out about how to click buttons to empower your life.',
          buttonLabel: 'Click here',
          imageUrl: 'assets/images/diet.png',
          link: '/page2',
          type: 'internal',
          category: 'Food',
        ),
        PromoEntity(
          title: 'Stay healthy',
          description: 'Learn how to stay healthy with our tips.',
          buttonLabel: 'Learn more',
          imageUrl: 'assets/images/hamburger.png',
          link: '/page3',
          type: 'internal',
          category: 'Health',
        ),
        PromoEntity(
          title: 'External Promo',
          description: 'This is an external promo.',
          buttonLabel: 'Check it out',
          imageUrl: 'assets/images/strawberry.png',
          link: '/page4',
          type: 'external',
          category: 'Shopping',
        ),
      ];
    });

    testWidgets('displays the correct number of promos',
        (WidgetTester tester) async {
      final promoBannerKey = GlobalKey<PromoBannerState>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PromoBanner(
                key: promoBannerKey, type: 'internal', promos: promos),
          ),
        ),
      );
      final promoBannerState = promoBannerKey.currentState as PromoBannerState;
      expect(promoBannerState.filteredPromos.length, 2);
      expect(find.byType(PromoBanner), findsOneWidget);
    });

    testWidgets('displays "No promotions available" when there are no promos',
        (WidgetTester tester) async {
      final List<PromoEntity> emptyPromos = [];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
                child: PromoBanner(type: 'internal', promos: emptyPromos)),
          ),
        ),
      );

      expect(find.text('No promotions available'), findsOneWidget);
    });

    testWidgets('displays the correct promo details',
        (WidgetTester tester) async {
      final promo = [promos[0]];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
                child: PromoBanner(type: 'internal', promos: promo)),
          ),
        ),
      );

      expect(find.text('Power your life'), findsWidgets);
      expect(
          find.text(
              'Find out about how to click buttons to empower your life.'),
          findsWidgets);
      expect(find.text('Click here'), findsWidgets);
      expect(find.byType(Image), findsWidgets);
      final Image image = tester.widget(find.byType(Image).first);
      expect((image.image as AssetImage).assetName, 'assets/images/diet.png');
    });

    testWidgets('displays the correct number of dots in the page indicator',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
                child: PromoBanner(type: 'internal', promos: promos)),
          ),
        ),
      );

      expect(find.byType(SmoothPageIndicator), findsOneWidget);
      final SmoothPageIndicator indicator =
          tester.widget(find.byType(SmoothPageIndicator));
      expect(indicator.count, 2);
    });
  });
}
