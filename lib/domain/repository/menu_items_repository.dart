import '../../data/menu_item_dto.dart';

abstract class MenuItemsRepository {
  Stream<List<MenuItemDto>> getMenuData();
}
