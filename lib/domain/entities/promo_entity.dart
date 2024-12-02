import '../../data/promo_dto.dart';

class PromoEntity {
  PromoEntity(
      {required this.title,
      required this.description,
      required this.buttonLabel,
      required this.imageUrl,
      required this.link,
      required this.type,
      required this.category});

  factory PromoEntity.fromDto(PromoDto dto) => PromoEntity(
      title: dto.title,
      description: dto.description,
      buttonLabel: dto.buttonLabel,
      imageUrl: dto.imageUrl,
      link: dto.link,
      type: dto.type,
      category: dto.category);

  final String title;
  final String description;
  final String buttonLabel;
  final String imageUrl;
  final String link;
  final String type;
  final String category;
}
