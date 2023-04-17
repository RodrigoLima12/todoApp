import 'package:dependencies/dependencies.dart';
import 'package:todo_module/src/domain/usecases/add_todo_usecase.dart';
import 'package:todo_module/src/external/datasources/todo_datasource.dart';
import 'package:todo_module/src/infra/repositories/todo_repository.dart';
import 'package:todo_module/src/presenter/controllers/form_controller.dart';
import 'package:todo_module/src/presenter/pages/home_page.dart';
import 'package:todo_module/src/presenter/stores/add_todo_store.dart';

class TodoModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => TodoDatasource(i())),
        Bind.lazySingleton((i) => TodoRepository(i())),
        Bind.lazySingleton((i) => AddTodoUseCase(i())),
        Bind.lazySingleton((i) => AddTodoStore(i())),
        Bind.lazySingleton((i) => FormController(store: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) =>
              HomePage(formController: Modular.get<FormController>()),
        ),
      ];
}
