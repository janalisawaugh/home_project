import '../entities/menu_item_entity.dart';
import '../repository/menu_items_repository.dart';

abstract class GetMenuItemsUsecase {
  Stream<List<MenuItemEntity>> getMenuItems();
}

class GetMenuItemsUsecaseImpl implements GetMenuItemsUsecase {
  GetMenuItemsUsecaseImpl(this._menuRepository);

  final MenuItemsRepository _menuRepository;

  @override
  Stream<List<MenuItemEntity>> getMenuItems() {
    return _menuRepository.getMenuData().map((menuItemDtos) {
      return menuItemDtos.map((dto) => MenuItemEntity.fromDto(dto)).toList();
    });
  }
}
