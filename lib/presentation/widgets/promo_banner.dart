import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:home_project/domain/promo_banner_model.dart';
import 'package:home_project/presentation/widgets/promo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/promo_banner_repository.dart';

class PromoBanner extends StatefulWidget {
  final String type;
  final PromoBannerRepository promoRepository;
  PromoBanner({required this.type, required this.promoRepository});

  @override
  State<PromoBanner> createState() => _PromoBanner();
}

class _PromoBanner extends State<PromoBanner> {
  int currentIndex = 0;
  late Future<List<PromoModel>> promos;

  Future<List<PromoModel>> loadPromos() async {
    List<PromoModel> allPromos = await widget.promoRepository.getPromos();
    return allPromos.where((promo) => promo.type == widget.type).toList();
  }

  @override
  void initState() {
    super.initState();
    promos = loadPromos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PromoModel>>(
        future: promos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 144,
              width: 328,
              decoration: BoxDecoration(color: Colors.grey[200]),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No promotions available'));
          }
          final promos = snapshot.data!;
          return Stack(
            children: [
              CarouselSlider(
                items: promos.map((promo) => Promo(promoModel: promo)).toList(),
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
                      count: promos.length,
                      effect: SlideEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: Colors.white,
                          dotColor: Colors.white.withOpacity(0.2))),
                ),
              )
            ],
          );
        });
  }
}
