import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_project/domain/entities/promo_entity.dart';
import 'package:home_project/domain/usecases/get_promos_usecase.dart';
import 'package:home_project/presentation/cubit/promo_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'promo_cubit_test.mocks.dart';

@GenerateMocks([GetPromosUsecase])
void main() {
  late MockGetPromosUsecase mockGetPromosUsecase;
  late PromoCubit promoCubit;
  late List<PromoEntity> promos;

  group('PromoCubit', () {
    setUp(() {
      mockGetPromosUsecase = MockGetPromosUsecase();
      promoCubit = PromoCubit(mockGetPromosUsecase);
      promos = [
        PromoEntity(
          title: 'Promo 1',
          description: 'Description 1',
          buttonLabel: 'Learn More',
          imageUrl: 'assets/images/diet.png',
          link: '/promo1',
          type: 'internal',
          category: 'Food',
        ),
      ];
    });

    blocTest<PromoCubit, PromoState>(
      'emits [loading, loaded] when getPromos is successful',
      build: () {
        when(mockGetPromosUsecase.getPromos()).thenAnswer(
          (_) => Stream.value(promos),
        );
        return promoCubit;
      },
      act: (cubit) => cubit.getPromos(),
      expect: () => [
        const PromoState.loading(),
        PromoState.loaded(promos),
      ],
    );

    blocTest<PromoCubit, PromoState>(
      'emits [loading, error] when getPromos throws an exception',
      build: () {
        when(mockGetPromosUsecase.getPromos())
            .thenThrow(Exception('Test Exception'));
        return promoCubit;
      },
      act: (cubit) => cubit.getPromos(),
      expect: () => [
        const PromoState.loading(),
        const PromoState.error(
            'Failed to load promos: Exception: Test Exception'),
      ],
    );

    blocTest<PromoCubit, PromoState>(
      'emits [loading, loaded] with empty list when usecase returns empty list',
      build: () {
        when(mockGetPromosUsecase.getPromos()).thenAnswer(
          (_) => Stream.value(<PromoEntity>[]),
        );
        return promoCubit;
      },
      act: (cubit) => cubit.getPromos(),
      expect: () => [
        const PromoState.loading(),
        const PromoState.loaded([]),
      ],
    );
  });
}
