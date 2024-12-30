import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/data/repository/promos_remote_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'promos_remote_repository_test.mocks.dart';

@GenerateMocks([AssetBundle])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('PromosRemoteRepository', () {
    late MockAssetBundle mockAssetBundle;
    late PromosRemoteRepository repository;

    setUp(() {
      mockAssetBundle = MockAssetBundle();
      repository = PromosRemoteRepository(bundle: mockAssetBundle);
    });

    test('fetches promos successfully', () async {
      final jsonString =
          '[{"title": "Power your life","description": "Find out about how to click buttons to empower your life.","buttonLabel": "Click here","imageUrl": "assets/images/diet.png","link": "/page2","type": "internal","category": "Food"}]';
      when(mockAssetBundle.loadString('assets/promos.json'))
          .thenAnswer((_) => Future.value(jsonString));

      final stream = repository.getPromoData();
      final promos = await stream.first;

      expect(promos, isNotEmpty);
      verify(mockAssetBundle.loadString('assets/promos.json'));
    });

    test('throws error on unsuccessful response', () async {
      when(mockAssetBundle.loadString('assets/promos.json'))
          .thenAnswer((_) => Future.value(('')));
      final stream = repository.getPromoData();
      final promos = await stream.first;

      expect(promos, isEmpty);
      verify(mockAssetBundle.loadString('assets/promos.json'));
    });
  });
}
