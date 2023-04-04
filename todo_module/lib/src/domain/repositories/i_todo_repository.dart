import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';

abstract class ITodoRepository {
  Future<TodoEntity> add(AddTodoDto dto);
}
