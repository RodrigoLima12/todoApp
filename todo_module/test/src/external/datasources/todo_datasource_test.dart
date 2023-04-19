import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';
import 'package:todo_module/src/external/datasources/todo_datasource.dart';

class LocalStorageServiceMock extends Mock implements ILocalStorageService {}

void main() {
  final service = LocalStorageServiceMock();
  final sut = TodoLocalDatasource(service);
  final params = AddTodoDto(
    description: '',
    targetDate: DateTime.now(),
    title: '',
  );

  tearDown(() => reset(service));

  test(
    'Should throw a ServiceFailure if local storage returns false',
    () async {
      //Arrange

      when(() => service.add(any(), any())).thenAnswer((_) async => false);

      //Assert
      expect(
        () async => await sut.add(params),
        throwsA(isA<ServerFailure>()),
      );
    },
  );

  test(
    'Should rethrow when LocalStorageService throws anything',
    () async {
      //Arrange

      when(() => service.add(any(), any())).thenThrow(Exception());

      //Assert
      expect(
        () async => await sut.add(params),
        throwsA(isA<Exception>()),
      );
    },
  );

  test(
    'Should return a TodoEntity when service returns true',
    () async {
      //Arrange

      when(() => service.add(any(), any())).thenAnswer((_) async => true);

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
