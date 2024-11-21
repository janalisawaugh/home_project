import 'package:home_project/domain/promo_banner_model.dart';
import 'package:home_project/ui_features/images.dart';

class PromoBannerRepository {
  Future<List<PromoModel>> getPromos() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      PromoModel(
          title: 'Power your life',
          description:
              'Find out about how to click buttons to empower your life.',
          buttonLabel: 'Click here',
          imageUrl: Images.diet,
          link: '/page2',
          type: 'internal',
          category: 'Food'),
      PromoModel(
          title: 'Power your life',
          description:
              'Find out about how to click buttons to empower your life.',
          buttonLabel: 'Click here',
          imageUrl: Images.diet,
          link: '/page2',
          type: 'internal',
          category: 'Health'),
      PromoModel(
          title: 'Power your life',
          description:
              'Find out about how to click buttons to empower your life.',
          buttonLabel: 'Click here',
          imageUrl: Images.diet,
          link: '/page2',
          type: 'external',
          category: 'Shopping'),
      PromoModel(
          title: 'Power your life',
          description:
              'Find out about how to click buttons to empower your life.',
          buttonLabel: 'Click here',
          imageUrl: Images.diet,
          link: '/page2',
          type: 'external',
          category: 'Music')
    ];
  }
}
