import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/data/menu_item_dto.dart';
import 'package:home_project/domain/repository/menu_items_repository.dart';
import 'package:home_project/domain/usecases/get_menu_items_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_menu_items_usecase_test.mocks.dart';

@GenerateMocks([MenuItemsRepository])
void main() {
  late MockMenuItemsRepository mockMenuItemsRepository =
      MockMenuItemsRepository();
  late GetMenuItemsUsecase getMenuItemsUsecase;

  group('GetMenuItemsUsecaseImpl', () {
    setUp(() {
      mockMenuItemsRepository = MockMenuItemsRepository();
      getMenuItemsUsecase = GetMenuItemsUsecaseImpl(mockMenuItemsRepository);
    });

    test('should return list of menu items', () async {
      final List<MenuItemDto> menuItemDtos = [
        MenuItemDto(
          icon: 'assets/images/hamburger.png',
          link: '/page',
          label: 'Burger',
          displayOrder: 1,
          enabled: true,
          parent: '/',
        )
      ];
      when(mockMenuItemsRepository.getMenuData())
          .thenAnswer((_) => Stream.fromIterable([menuItemDtos]));
      final stream = getMenuItemsUsecase.getMenuItems();
      final result = await stream.toList();
      expect(result.length, 1);
      expect(result.first.length, menuItemDtos.length);
      expect(result.first[0].icon, 'assets/images/hamburger.png');
      expect(result.first[0].link, '/page');
      expect(result.first[0].label, 'Burger');
      expect(result.first[0].displayOrder, 1);
      expect(result.first[0].enabled, true);
      expect(result.first[0].parent, '/');
      verify(mockMenuItemsRepository.getMenuData()).called(1);
    });

    test('emits empty list when stream is empty', () async {
      when(mockMenuItemsRepository.getMenuData())
          .thenAnswer((_) => Stream.fromIterable([<MenuItemDto>[]]));
      final stream = getMenuItemsUsecase.getMenuItems();
      final result = await stream.toList();

      expect(result.length, 1);
      expect(result.first.length, 0);
      verify(mockMenuItemsRepository.getMenuData()).called(1);
    });
  });
}
