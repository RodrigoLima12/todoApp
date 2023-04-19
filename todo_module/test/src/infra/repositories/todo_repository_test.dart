import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';
import 'package:todo_module/src/infra/datasources/i_todo_datasource.dart';
import 'package:todo_module/src/infra/repositories/todo_repository.dart';

import '../../mocks/mocks.dart';

class TodoDatasourceMock extends Mock implements ITodoLocalDatasource {}

class AddTodoDtoMock extends Mock implements AddTodoDto {}

void main() {
  final ITodoLocalDatasource datasource = TodoDatasourceMock();

  final sut = TodoRepository(datasource);

  tearDown(() {
    reset(datasource);
  });

  test(
    'Should rethrow when datasource throws a Failure',
    () async {
      //Arrange
      final params = AddTodoDtoMock();
      when(() => datasource.add(params)).thenThrow(FailureMock());

      //Assert
      expect(
        () async => await sut.add(params),
        throwsA(isA<AppFailure>()),
      );
    },
  );

  test(
    'Should throw UnknownFailure when datasource throws anything.',
    () async {
      //Arrange
      final params = AddTodoDtoMock();
      when(() => datasource.add(params)).thenThrow(Exception());

      //Assert
      expect(
        () async => await sut.add(params),
        throwsA(isA<UnknownFailure>()),
      );
    },
  );

  test(
    'Should return a TodoEntity when datasource returns a valid entity',
    () async {
      //Arrange
      final params = AddTodoDtoMock();
      when(() => datasource.add(params)).thenAnswer((_) async => TodoEntityMock());

      //Act
      final result = await sut.add(params);

      //Assert
      expect(
        result,
        isA<TodoEntity>(),
      );
    },
  );
}
