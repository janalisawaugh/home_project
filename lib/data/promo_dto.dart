import 'package:json_annotation/json_annotation.dart';
part 'promo_dto.g.dart';

@JsonSerializable()
class PromoDto {
  PromoDto(
      {required this.title,
      required this.description,
      required this.buttonLabel,
      required this.imageUrl,
      required this.link,
      required this.type,
      required this.category});

  factory PromoDto.fromJson(Map<String, dynamic> json) =>
      _$PromoDtoFromJson(json);

  final String title;
  final String description;
  final String buttonLabel;
  final String imageUrl;
  final String link;
  final String type;
  final String category;

  Map<String, dynamic> toJson() => _$PromoDtoToJson(this);
}
