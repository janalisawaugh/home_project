import '../../data/promo_dto.dart';

abstract class PromosRepository {
  Stream<List<PromoDto>> getPromoData();
}
