import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/menu_item_entity.dart';
import '../../domain/usecases/get_menu_items.dart';

part 'menu_state.dart';
part 'menu_cubit.freezed.dart';

class MenuCubit extends Cubit<MenuState> {
  final GetMenuItemsUsecase _getMenuItemsUsecase;
  MenuCubit(this._getMenuItemsUsecase) : super(const MenuState.loading());
  void getMenuItems() async {
    try {
      emit(const MenuState.loading());
      await for (final menuItems in _getMenuItemsUsecase.getMenuItems()) {
        emit(MenuState.loaded(menuItems));
      }
    } catch (e) {
      emit(MenuState.error('Failed to load menu items: $e'));
    }
  }
}
