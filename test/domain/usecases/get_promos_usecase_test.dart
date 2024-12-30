import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/data/promo_dto.dart';
import 'package:home_project/domain/repository/promos_repository.dart';
import 'package:home_project/domain/usecases/get_promos_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_promos_usecase_test.mocks.dart';

@GenerateMocks([PromosRepository])
void main() {
  late MockPromosRepository mockPromosRepository = MockPromosRepository();
  late GetPromosUsecase getPromosUsecase;

  group('GetPromosUsecaseImpl', () {
    setUp(() {
      mockPromosRepository = MockPromosRepository();
      getPromosUsecase = GetPromosUsecaseImpl(mockPromosRepository);
    });

    test('should return list of menu items', () async {
      final List<PromoDto> promoDtos = [
        PromoDto(
            title: 'Power your life',
            description:
                'Find out about how to click buttons to empower your life.',
            buttonLabel: 'Click here',
            imageUrl: 'assets/images/diet.png',
            link: '/page2',
            type: 'internal',
            category: 'Food')
      ];
      when(mockPromosRepository.getPromoData())
          .thenAnswer((_) => Stream.fromIterable([promoDtos]));
      final stream = getPromosUsecase.getPromos();
      final result = await stream.toList();
      expect(result.length, 1);
      expect(result.first.length, promoDtos.length);
      expect(result.first[0].title, 'Power your life');
      expect(result.first[0].description,
          'Find out about how to click buttons to empower your life.');
      expect(result.first[0].buttonLabel, 'Click here');
      expect(result.first[0].imageUrl, 'assets/images/diet.png');
      expect(result.first[0].link, '/page2');
      expect(result.first[0].type, 'internal');
      expect(result.first[0].category, 'Food');
      verify(mockPromosRepository.getPromoData()).called(1);
    });

    test('emits empty list when stream is empty', () async {
      when(mockPromosRepository.getPromoData())
          .thenAnswer((_) => Stream.fromIterable([<PromoDto>[]]));
      final stream = getPromosUsecase.getPromos();
      final result = await stream.toList();

      expect(result.length, 1);
      expect(result.first.length, 0);
      verify(mockPromosRepository.getPromoData()).called(1);
    });
  });
}
