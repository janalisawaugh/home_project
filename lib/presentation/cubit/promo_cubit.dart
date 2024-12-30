import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/usecases/get_promos_usecase.dart';
import '../../domain/entities/promo_entity.dart';

part 'promo_state.dart';
part 'promo_cubit.freezed.dart';

class PromoCubit extends Cubit<PromoState> {
  final GetPromosUsecase _getPromosUsecase;
  PromoCubit(this._getPromosUsecase) : super(const PromoState.loading());
  void getPromos() async {
    try {
      emit(const PromoState.loading());
      await for (final promos in _getPromosUsecase.getPromos()) {
        emit(PromoState.loaded(promos));
      }
    } catch (e) {
      emit(PromoState.error('Failed to load promos: $e'));
    }
  }
}
