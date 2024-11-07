import 'package:home_project/domain/menu_item_model.dart';
import 'package:home_project/ui_features/images.dart';

class MenuRepository {
  Future<List<MenuItemModel>> getMenuItems() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      MenuItemModel(
        icon: Images.diet,
        link: '/page1',
        label: 'Page 1',
        displayOrder: 1,
        enabled: true,
        parent: 0,
      ),
      MenuItemModel(
        icon: Images.fries,
        link: '/page2',
        label: 'Page 2',
        displayOrder: 2,
        enabled: true,
        parent: 0,
      ),
      MenuItemModel(
        icon: Images.hamburger,
        link: '/page2',
        label: 'Page 3',
        displayOrder: 3,
        enabled: true,
        parent: 0,
      ),
      MenuItemModel(
        icon: Images.ramen,
        link: '/page2',
        label: 'Page 4',
        displayOrder: 4,
        enabled: true,
        parent: 0,
      ),
      MenuItemModel(
        icon: Images.strawberry,
        link: '/page2',
        label: 'Page 5',
        displayOrder: 5,
        enabled: true,
        parent: 0,
      ),
      MenuItemModel(
        icon: Images.taco,
        link: '/page2',
        label: 'Page 6',
        displayOrder: 6,
        enabled: true,
        parent: 0,
      )
    ];
  }
}
