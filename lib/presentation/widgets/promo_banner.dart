import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:home_project/domain/promo_banner_model.dart';
import 'package:home_project/presentation/widgets/promo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../data/promo_banner_repository.dart';
import '../../domain/entities/promo_entity.dart';

class PromoBanner extends StatefulWidget {
  final String type;
  final List<PromoEntity> promos;
  const PromoBanner({super.key, required this.type, required this.promos});

  @override
  State<PromoBanner> createState() => _PromoBanner();
}

class _PromoBanner extends State<PromoBanner> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final filteredPromos =
        widget.promos.where((promo) => promo.type == widget.type).toList();
    if (filteredPromos.isEmpty) {
      return const Center(child: Text('No promotions available'));
    }
    return Stack(
      children: [
        CarouselSlider(
          items:
              filteredPromos.map((promo) => Promo(promoEntity: promo)).toList(),
          options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Center(
            child: SmoothPageIndicator(
                controller: PageController(initialPage: currentIndex),
                count: filteredPromos.length,
                effect: SlideEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white.withOpacity(0.2))),
          ),
        )
      ],
    );
  }
}
