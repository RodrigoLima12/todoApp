import 'package:core/core.dart';
import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';

import '../repositories/i_todo_repository.dart';

abstract class IAddTodoUseCase {
  Future<TodoEntity> call(AddTodoDto dto);
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
  Future<TodoEntity> call(AddTodoDto dto) {
    if (dto.title.isEmpty) {
      throw InvalidTitleFailure(message: 'Título inválido');
    }
    if (dto.description.isEmpty) {
      throw InvalidDescriptionFailure(message: 'Descrição inválida');
    }
    final DateTime lastDayHour = DateTime.now().copyWith(
      hour: 23,
      minute: 59,
      second: 59,
    );
    if (dto.targetDate.isBefore(lastDayHour)) {
      throw InvalidTargetDateFailure(
        message: 'A data de término não pode ser para hoje',
      );
    }

    return _repository.add(dto);
  }
}
