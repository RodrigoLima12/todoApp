import 'package:core/core.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';
import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';
import 'package:todo_module/src/domain/repositories/i_todo_repository.dart';
import 'package:todo_module/src/infra/datasources/i_todo_datasource.dart';

class TodoRepository implements ITodoRepository {
  final ITodoDatasource _datasource;

  const TodoRepository(this._datasource);

  @override
  Future<TodoEntity> add(AddTodoDto dto) async {
    try {
      final response = await _datasource.add(dto);
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
