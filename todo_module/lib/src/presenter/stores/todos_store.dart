// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';
import 'package:todo_module/src/external/mappers/todo_mapper.dart';

class TodosStore extends Store<List<TodoEntity>> {
  final ILocalStorageService localStorageService;
  final IConnectionService _connectionService;

  TodosStore(this.localStorageService, this._connectionService) : super([]);

  Future<void> getTodos() async {
    try {
      setLoading(true);
      late final List<Map<String, dynamic>> todos;
      await Future.delayed(Duration(seconds: 2));

      if (_connectionService.isOnline) {
        todos = await localStorageService.get('onlineTodos');
      } else {
        todos = await localStorageService.get('todos');
      }

      final todosEntity = todos.map((e) => TodoMapper.fromMap(e)).toList();
      update(todosEntity);
    } on AppFailure catch (error) {
      setError(error);
    } finally {
      setLoading(false);
    }
  }
}
