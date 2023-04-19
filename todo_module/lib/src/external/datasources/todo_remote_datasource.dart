import 'package:core/core.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';
import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';
import 'package:todo_module/src/infra/datasources/i_todo_datasource.dart';

import '../../infra/datasources/i_todo_remote_datasource.dart';
import '../mappers/todo_mapper.dart';

class TodoRemoteDatasource implements ITodoRemoteDatasource {
  final ILocalStorageService _localStorageService;

  const TodoRemoteDatasource(this._localStorageService);

  @override
  Future<TodoEntity> add(AddTodoDto dto) async {
    final Map<String, dynamic> todoMap = TodoMapper.dtoToMap(dto);
    final result = await _localStorageService.add('onlineTodos', todoMap);

    if (result) {
      return TodoMapper.fromMap(todoMap);
    } else {
      throw ServerFailure(message: 'Falha ao adicionar a Todo no armazenamento remoto.');
    }
  }
}
