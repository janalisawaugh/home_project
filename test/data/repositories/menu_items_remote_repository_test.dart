import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/data/repository/menu_items_remote_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'menu_items_remote_repository_test.mocks.dart';

@GenerateMocks([AssetBundle])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('MenuItemsRemoteRepository', () {
    late MockAssetBundle mockAssetBundle;
    late MenuItemsRemoteRepository repository;

    setUp(() {
      mockAssetBundle = MockAssetBundle();
      repository = MenuItemsRemoteRepository(bundle: mockAssetBundle);
    });

    test('fetches menu items successfully', () async {
      final jsonString =
          '[{"icon": "assets/images/diet.png","link": "/page1","label": "Page 1","displayOrder": 1,"enabled": true,"parent": "/"}]';
      when(mockAssetBundle.loadString('assets/menu_items.json'))
          .thenAnswer((_) => Future.value(jsonString));

      final stream = repository.getMenuData();
      final menuItems = await stream.first;

      expect(menuItems, isNotEmpty);
      verify(mockAssetBundle.loadString('assets/menu_items.json'));
    });

    test('throws error on unsuccessful response', () async {
      when(mockAssetBundle.loadString('assets/menu_items.json'))
          .thenAnswer((_) => Future.value(('')));
      final stream = repository.getMenuData();
      final menuItems = await stream.first;

      expect(menuItems, isEmpty);
      verify(mockAssetBundle.loadString('assets/menu_items.json'));
    });
  });
}
