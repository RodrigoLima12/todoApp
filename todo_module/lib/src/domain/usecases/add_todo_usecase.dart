import 'package:todo_module/src/domain/entities/todo_entity.dart';

import '../repositories/i_todo_repository.dart';

abstract class IAddTodoUseCase {
  Future<TodoEntity> call();
}

class AddTodoUseCase implements IAddTodoUseCase {
  final ITodoRepository _repository;

  //Propriedade privada nomeada
  // const AddTodoUseCase({
  // required ITodoRepository repository,
  // }):_repository = repository, _otherVariable = otherVariable, super();

  const AddTodoUseCase(
    this._repository,
  );

  @override
  Future<TodoEntity> call() {}
}
