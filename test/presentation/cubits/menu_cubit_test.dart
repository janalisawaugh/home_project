import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/domain/entities/menu_item_entity.dart';
import 'package:home_project/domain/usecases/get_menu_items_usecase.dart';
import 'package:home_project/presentation/cubit/menu_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'menu_cubit_test.mocks.dart';

@GenerateMocks([GetMenuItemsUsecase])
void main() {
  late MockGetMenuItemsUsecase mockGetMenuItemsUsecase;
  late MenuCubit menuCubit;
  late List<MenuItemEntity> menuItems;
  group('MenuCubit', () {
    setUp(() {
      mockGetMenuItemsUsecase = MockGetMenuItemsUsecase();
      menuCubit = MenuCubit(mockGetMenuItemsUsecase);
      menuItems = [
        MenuItemEntity(
          icon: 'assets/images/diet.png',
          link: '/page1',
          label: 'Page 1',
          displayOrder: 1,
          enabled: true,
          parent: '/',
        ),
      ];
    });

    blocTest<MenuCubit, MenuState>(
      'emits [loading, loaded] when getMenuItems is successful',
      build: () {
        when(mockGetMenuItemsUsecase.getMenuItems()).thenAnswer(
          (_) => Stream.value(menuItems),
        );
        return menuCubit;
      },
      act: (cubit) => cubit.getMenuItems(),
      expect: () => <MenuState>[
        const MenuState.loading(),
        MenuState.loaded(menuItems),
      ],
    );
    blocTest<MenuCubit, MenuState>(
      'emits [loading, error] when getMenuItems throws an exception',
      setUp: () {
        when(mockGetMenuItemsUsecase.getMenuItems())
            .thenThrow(Exception('Test Exception'));
      },
      build: () => menuCubit,
      act: (cubit) => cubit.getMenuItems(),
      expect: () => [
        const MenuState.loading(),
        const MenuState.error(
            'Failed to load menu items: Exception: Test Exception'),
      ],
    );
    blocTest<MenuCubit, MenuState>(
      'emits [loading, loaded] with empty list when usecase returns empty list',
      setUp: () {
        when(mockGetMenuItemsUsecase.getMenuItems()).thenAnswer(
          (_) => Stream.fromIterable([<MenuItemEntity>[]]),
        );
      },
      build: () => menuCubit,
      act: (cubit) => cubit.getMenuItems(),
      expect: () => [
        const MenuState.loading(),
        const MenuState.loaded([]),
      ],
    );
  });
}
