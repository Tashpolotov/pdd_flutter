import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_rank_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/features/rating/view/rating_view.dart';
import 'package:pdd_flutter_new_24_04_25/models/rank/RankModel.dart';

import 'rating_view_test.mocks.dart';

@GenerateMocks([GetRankUseCase])
void main() {
  group('RatingView Tests', () {
    late MockGetRankUseCase mockGetRankUseCase;

    setUp(() {
      mockGetRankUseCase = MockGetRankUseCase();
    });

    testWidgets('should show loading initially', (tester) async {
      when(mockGetRankUseCase.execute()).thenAnswer(
        (_) async => <RankModel>[],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Provider<GetRankUseCase>.value(
            value: mockGetRankUseCase,
            child: const RatingView(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Рейтинг'), findsOneWidget);
      
      await tester.pumpAndSettle();
      
      expect(find.text('Нет данных для отображения'), findsOneWidget);
    });

    testWidgets('should show users list when data loaded', (tester) async {
      final mockUsers = [
        RankModel(
          completeLesson: 10,
          completedTest: 5,
          id: 1,
          image: 'test.jpg',
          isCurrentUser: true,
          rank: 'Новичок',
          tempRank: 1,
          totalPoints: 150,
          user: 'Тест Юзер',
        ),
        RankModel(
          completeLesson: 8,
          completedTest: 4,
          id: 2,
          image: 'test2.jpg',
          isCurrentUser: false,
          rank: 'Начинающий',
          tempRank: 2,
          totalPoints: 120,
          user: 'Другой Юзер',
        ),
      ];

      when(mockGetRankUseCase.execute()).thenAnswer((_) async => mockUsers);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Provider<GetRankUseCase>.value(
            value: mockGetRankUseCase,
            child: const RatingView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Рейтинг'), findsOneWidget);
      expect(find.text('Лучшие по баллам'), findsOneWidget);
      expect(find.text('150'), findsAtLeastNWidgets(1));
      expect(find.text('1'), findsAtLeastNWidgets(1));
      expect(find.text('10'), findsAtLeastNWidgets(1));
    });

    testWidgets('should show error when API fails', (tester) async {
      when(mockGetRankUseCase.execute()).thenThrow(
        Exception('Сервер недоступен'),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Provider<GetRankUseCase>.value(
            value: mockGetRankUseCase,
            child: const RatingView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Ошибка: Exception: Сервер недоступен'), findsOneWidget);
    });

    testWidgets('should show empty state when no users', (tester) async {
      when(mockGetRankUseCase.execute()).thenAnswer((_) async => <RankModel>[]);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Provider<GetRankUseCase>.value(
            value: mockGetRankUseCase,
            child: const RatingView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Нет данных для отображения'), findsOneWidget);
    });
  });
}
