part of 'promo_cubit.dart';

@freezed
class PromoState with _$PromoState {
  const factory PromoState.loading() = _Loading;
  const factory PromoState.loaded(List<PromoEntity> promos) = _Loaded;
  const factory PromoState.error(String message) = _Error;
}
