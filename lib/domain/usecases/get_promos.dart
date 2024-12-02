import '../entities/promo_entity.dart';
import '../repository/promos_repository.dart';

abstract class GetPromosUsecase {
  Stream<List<PromoEntity>> getPromos();
}

class GetPromosUsecaseImpl implements GetPromosUsecase {
  GetPromosUsecaseImpl(this._promoRepository);

  final PromosRepository _promoRepository;

  @override
  Stream<List<PromoEntity>> getPromos() {
    return _promoRepository.getPromoData().map((promoDtos) {
      return promoDtos.map((dto) => PromoEntity.fromDto(dto)).toList();
    });
  }
}
