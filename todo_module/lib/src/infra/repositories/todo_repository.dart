import 'package:core/core.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';
import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';
import 'package:todo_module/src/domain/repositories/i_todo_repository.dart';
import 'package:todo_module/src/infra/datasources/i_todo_datasource.dart';

import '../datasources/i_todo_remote_datasource.dart';

class TodoRepository implements ITodoRepository {
  final ITodoLocalDatasource _localDatasource;
  final IConnectionService _connectionService;
  final ITodoRemoteDatasource _remoteDatasource;

  const TodoRepository(this._localDatasource, this._connectionService, this._remoteDatasource);

  @override
  Future<TodoEntity> add(AddTodoDto dto) async {
    try {
      final response = await _localDatasource.add(dto);

      if (_connectionService.isOnline) {
        await _remoteDatasource.add(dto);
      }

      return response;
    } on AppFailure {
      rethrow;
    } catch (e, s) {
      throw UnknownFailure(
        message: 'Erro ao adicionar tarefa.',
        stackTrace: s,
        exception: e,
      );
    }
  }
}
