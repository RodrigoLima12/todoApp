// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';
import 'package:todo_module/src/external/mappers/todo_mapper.dart';

class TodosStore extends Store<List<TodoEntity>> {
  final ILocalStorageService localStorageService;
  TodosStore(this.localStorageService) : super([]);

  Future<void> getTodos() async {
    try {
      setLoading(true);
      final todos = await localStorageService.get('todos');
      final todosEntity = todos.map((e) => TodoMapper.fromMap(e)).toList();
      update(todosEntity);
    } on AppFailure catch (error) {
      setError(error);
    } finally {
      setLoading(false);
    }
  }
}
