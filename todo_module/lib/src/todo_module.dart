import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:todo_module/src/domain/usecases/add_todo_usecase.dart';
import 'package:todo_module/src/external/datasources/todo_datasource.dart';
import 'package:todo_module/src/external/datasources/todo_remote_datasource.dart';
import 'package:todo_module/src/infra/repositories/todo_repository.dart';
import 'package:todo_module/src/presenter/controllers/form_controller.dart';
import 'package:todo_module/src/presenter/pages/add_todo_page.dart';
import 'package:todo_module/src/presenter/pages/home_page.dart';
import 'package:todo_module/src/presenter/stores/add_todo_store.dart';
import 'package:todo_module/src/presenter/stores/todos_store.dart';

class TodoModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => TodoRemoteDatasource(i())),
        Bind.lazySingleton((i) => TodoLocalDatasource(i(), i(), i())),
        Bind.lazySingleton((i) => TodoRepository(i(), i(), i())),
        Bind.lazySingleton((i) => AddTodoUseCase(i())),
        Bind.factory((i) => AddTodoStore(i())),
        Bind.lazySingleton((i) => TodosStore(i(), i())),
        Bind.factory((i) => FormController(store: i(), todosStore: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomePage(
            store: Modular.get<TodosStore>(),
            connectionStore: Modular.get<ConnectionStore>(),
            syncStore: Modular.get<SyncStore>(),
          ),
        ),
        ChildRoute(
          '/add',
          child: (_, __) =>
              AddTodoPage(formController: Modular.get<FormController>()),
        ),
      ];
}
