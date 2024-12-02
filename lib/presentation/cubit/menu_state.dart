part of 'menu_cubit.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState.loading() = _Loading;
  const factory MenuState.loaded(List<MenuItemEntity> menuItems) = _Loaded;
  const factory MenuState.error(String message) = _Error;
}
