import 'dart:math';

import 'package:core/core.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';
import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';
import 'package:todo_module/src/infra/datasources/i_todo_datasource.dart';

import '../mappers/todo_mapper.dart';

class TodoLocalDatasource implements ITodoLocalDatasource {
  final ILocalStorageService _localStorageService;
  final IConnectionService _connectionService;
  final SyncStore _syncStore;

  const TodoLocalDatasource(
    this._localStorageService,
    this._connectionService,
    this._syncStore,
  );

  @override
  Future<TodoEntity> add(AddTodoDto dto) async {
    final Map<String, dynamic> todoMap = TodoMapper.dtoToMap(dto);
    final result = await _localStorageService.add('todos', todoMap);

    if (result) {
      final todo = TodoMapper.fromMap(todoMap);

      if (!_connectionService.isOnline) {
        await _syncStore.addSync(SyncModel(
          id: Random().nextInt(9999999),
          key: 'onlineTodos',
          data: todoMap,
          valueId: todo.id,
          operation: SyncOperationEnum.add,
        ));
      }
      return todo;
    } else {
      throw ServerFailure(
          message: 'Falha ao adicionar a Todo no armazenamento local.');
    }
  }
}
