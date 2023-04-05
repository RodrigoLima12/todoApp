import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';
import 'package:todo_module/src/domain/repositories/i_todo_repository.dart';
import 'package:todo_module/src/domain/usecases/add_todo_usecase.dart';

class TodoRepository extends Mock implements ITodoRepository {}

void main() {
  final ITodoRepository repository = TodoRepository();
  final useCase = AddTodoUseCase(repository);

  setUpAll(() {});
  setUp(() {});
  tearDown(() {});
  tearDownAll(() {});

  test(
    'Should throw a InvalidTitleFailure when user inputs a empty string as TodoEntity title',
    () async {
      //Arrange

      final params = AddTodoDto(
        title: '',
        description: 'description',
        targetDate: DateTime.now().add(
          const Duration(days: 1),
        ),
      );

      //Assert
      expect(
        () async => await useCase(params),
        throwsA(isA<InvalidTitleFailure>()),
      );
    },
  );

  test(
    'Should throw a InvalidDescriptionFailure when user inputs a empty string as TodoEntity description',
    () {
      //Arrange
      final params = AddTodoDto(
        title: 'Title',
        description: '',
        targetDate: DateTime.now().add(
          const Duration(days: 1),
        ),
      );

      //Assert
      expectLater(
        () async => await useCase(params),
        throwsA(isA<InvalidDescriptionFailure>()),
      );
    },
  );

  test(
    'Should throw a InvalidTargetDateFailure when user inputs a targetDate that is today or before',
    () {
      //Arrange
      final params =
          AddTodoDto(title: 'Title', description: 'description', targetDate: DateTime.now());

      //Assert
      expect(
        () async => await useCase(params),
        throwsA(isA<InvalidTargetDateFailure>()),
      );
    },
  );

  test(
    'Should return a TodoEntity when repository returns a valid entity',
    () async {
      //Arrange
      final params = AddTodoDto(
        title: 'Title',
        description: 'description',
        targetDate: DateTime.now().add(const Duration(days: 1)),
      );

      final entity = TodoEntity(
        id: 1,
        title: params.title,
        description: params.description,
        createdAt: DateTime.now(),
        targetDate: params.targetDate,
      );

      when(() => repository.add(params)).thenAnswer((_) async => entity);

      //Act
      final result = await useCase(params);

      //Assert
      expect(
        result,
        isA<TodoEntity>(),
      );
    },
  );

  test(
    'Should throw an Exception when repository throws',
    () {
      //Arrange
      final params = AddTodoDto(
        title: 'Title',
        description: 'description',
        targetDate: DateTime.now().add(const Duration(days: 1)),
      );
      when(() => repository.add(params)).thenThrow(Exception());

      //Assert
      expect(
        () async => await useCase(params),
        throwsA(isA<Exception>()),
      );
    },
  );
}
