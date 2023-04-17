// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:todo_module/src/domain/usecases/add_todo_usecase.dart';

import '../../domain/dtos/add_todo_dto.dart';

class AddTodoStore extends Store<bool> {
  AddTodoStore(
    this._addTodoUseCase,
  ) : super(false);

  final AddTodoUseCase _addTodoUseCase;

  void addTodo(AddTodoDto dto) async {
    try {
      setLoading(true);
      await _addTodoUseCase(dto);

      update(true);
    } on AppFailure catch (error) {
      setError(error);
    } finally {
      setLoading(false);
    }
  }
}
